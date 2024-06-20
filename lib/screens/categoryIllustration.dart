import 'package:flutter/material.dart';
import 'package:commission_art_app2/widgets/card_items.dart';
import 'package:commission_art_app2/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commission_art_app2/constant/constant_firebase_collections.dart';
import 'package:get/get.dart';

class CategoryIllustration extends StatefulWidget {
  @override
  _CategoryIllustrationState createState() => _CategoryIllustrationState();
}

class _CategoryIllustrationState extends State<CategoryIllustration> {
  final RxList<ProductModel> _digitalArtProductList = <ProductModel>[].obs;
  final RxBool _isLoading = false.obs;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  @override
  void initState() {
    super.initState();
    getDigitalArtProduct();
  }

  Future<void> getDigitalArtProduct() async {
    _isLoading.value = true;
    try {
      final items = await productCollection
          .where("category", isEqualTo: "Illustration")
          .get();
      _digitalArtProductList.clear();
      _digitalArtProductList.addAll(items.docs.map((doc) =>
          ProductModel.fromJson(doc.data() as Map<String, dynamic>)));
    } catch (e) {
      print('Error getting digital art products: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Illustration'),
      ),
      body: Obx(
        () {
          if (_isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (_digitalArtProductList.isEmpty) {
            return Center(child: Text('No digital art products found.'));
          } else {
            return GridView.count(
              childAspectRatio: 0.68,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: _digitalArtProductList.map((product) {
                return CardItems(product); // Mengirim ProductModel ke CardItems
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
