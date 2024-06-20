import 'package:commission_art_app2/route/route_name.dart';
import 'package:commission_art_app2/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final SearchFeatureController _searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) async => _searchController.searchProduct(value),
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: const Icon(Icons.search, size: 24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (_searchController.isLoading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (!_searchController.isLoading.isTrue && _searchController.searchProducts.isNotEmpty) {
                    return ListView.builder(
                      itemCount: _searchController.searchProducts.length,
                      itemBuilder: (context, index) {
                        final product = _searchController.searchProducts[index];
                        return ListTile(
                           onTap: () => Get.toNamed(RouteName.detailScreen,
                            arguments: {"product_id": product["product_id"]}),
                          title: Text(
                            product["artTitle"],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          leading: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(product["imagePath"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Rp ${product["price"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${product["rating"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

                 
                  return Center(
                    child: Text(
                      "Find your art here...",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
