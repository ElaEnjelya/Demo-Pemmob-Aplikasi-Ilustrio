// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commission_art_app2/constant/constant_firebase_collections.dart';
import 'package:commission_art_app2/model/order_model.dart';
import 'package:commission_art_app2/model/product_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  String _productId = '0';

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  CollectionReference bookmarkCollection =
      FirebaseCollectionConstants.getBookmarkCollection();

  final Rx<ProductModel> _productModel = ProductModel(
          productId: '',
          imagePath: '',
          artTitle: '',
          price: '0',
          rating: 0,
          imagePathProfile: '',
          artist: '',
          category: '',
          recomendation: '')
      .obs;

  Rx<ProductModel> get productModel => _productModel;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  @override
  void onInit() {
    super.onInit();
    runGetDetailProduct();
  }

  Future<void> getDetailProduct() async {
    _isLoading.value = true;
    try {
      final response = await productCollection.doc(_productId).get();
      _productModel.value =
          ProductModel.fromJson(response.data() as Map<String, dynamic>);
    } catch (e, st) {
      log('ERROR FROM GET DETAIL PRODUCT $e $st');
    } finally {
      _isLoading.value = false;
    }
  }

  void runGetDetailProduct() async {
    final args = Get.arguments as Map<String, dynamic>;
    if (args.isNotEmpty) {
      if (args.containsKey("product_id")) {
        _productId = args["product_id"];
      }
      await getDetailProduct();
    }
  }

  var orderHistory = <OrderModel>[].obs;

  Future<void> createOrder({
    required String namaPemesan,
    required int jumlahItem,
    required String artTitle,
    required double totalHarga,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final orderId =
            FirebaseFirestore.instance.collection('Riwayat pesanan').doc().id;
        final order = OrderModel(
          id: orderId, // Atur ID order sesuai kebutuhan
          namaPemesan: namaPemesan,
          jumlahItem: jumlahItem,
          artTitle: artTitle,
          totalHarga: totalHarga,
        );

        await FirebaseFirestore.instance
            .collection('Riwayat pesanan')
            .doc(orderId)
            .set(order.toMap());

        orderHistory.add(order); // Tambahkan pesanan ke riwayat lokal
        update(); // Update tampilan jika diperlukan

        // Get.to(() => OrderFormPage(orderModel: order)); // Navigasi ke halaman order
      } else {
        throw Exception('User not authenticated');
      }
    } catch (e) {
      print('ERROR FROM CREATE ORDER $e');
      Get.snackbar(
        'Error',
        'Gagal membuat pesanan. Silakan coba lagi.',
        duration: Duration(seconds: 3),
      );
    }
  }
}
