import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commission_art_app2/constant/constant_firebase_collections.dart';

class SearchFeatureController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  CollectionReference productCollection =
      FirebaseCollectionConstants.getProductCollection();

  final RxList<Map<String, dynamic>> _searchProducts =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> get searchProducts => _searchProducts;

  Future<void> searchProduct(String query) async {
    _searchProducts.clear();
    try {
      _isLoading.value = true;

      // Transform the query to match Firestore data format
      final newQuery = query
          .split(" ")
          .map((word) => word[0].toUpperCase() + word.substring(1)).join("");

      print("Transformed query: $newQuery");

      // Perform the Firestore query
      final data = await productCollection
          .where("artTitle", isGreaterThanOrEqualTo: newQuery)
          .where("artTitle", isLessThan: "${newQuery}z")
          .get();

      // Check if data was retrieved
      if (data.docs.isEmpty) {
        print("No products found matching the query: $newQuery");
      }

      // Using a set to avoid duplicate entries
      final Set<Map<String, dynamic>> uniqueProducts = {};

      for (final product in data.docs) {
        uniqueProducts.add(product.data() as Map<String, dynamic>);
      }

      // Convert set back to list and assign to _searchProducts
      _searchProducts.assignAll(uniqueProducts.toList());
    } catch (e) {
      // Log the specific error
      print("Error searching product: $e");
    } finally {
      _isLoading.value = false;
    }
  }
}
