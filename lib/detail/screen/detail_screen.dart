import 'package:commission_art_app2/pages/orderPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:commission_art_app2/detail/controller/detail.controller.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required String productId});

  final DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (detailController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          detailController.productModel.value.imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          detailController.productModel.value.imagePathProfile),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detailController.productModel.value.artist,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(detailController.productModel.value.category),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            SizedBox(width: 2),
                            Text(
                              detailController.productModel.value.rating
                                  .toString(),
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: () {
                        // Aksi bookmark
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  detailController.productModel.value.artTitle,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Rp ${detailController.productModel.value.price}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(),
                        ),
                      );

                      // Aksi pesan
                    },
                    child: Text('Pesan'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 15.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
