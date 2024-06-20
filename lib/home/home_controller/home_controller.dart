import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commission_art_app2/constant/constant_firebase_collections.dart';
import 'package:commission_art_app2/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<ProductModel> _recommendationProductList = <ProductModel>[].obs;
  RxList<ProductModel> get recommendationProductList =>
      _recommendationProductList;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  Future<void> getRecommendationProduct() async {
    try {
      _recommendationProductList
          .clear(); // Membersihkan list sebelum memuat data baru
      final data = await productCollection
          .where("recomendation", isEqualTo: "Yes")
          .get();

      for (final product in data.docs) {
        _recommendationProductList
            .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
      }
    } catch (e) {
      log("ERROR FROM GET RECOMMENDED PRODUCT $e");
    }
  }

  Future<void> runGetProduct() async {
    _isLoading.value = true;
    try {
      await getRecommendationProduct();
    } catch (e) {
      log('ERROR FROM RUN GET PRODUCT');
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await runGetProduct();
  }
}
