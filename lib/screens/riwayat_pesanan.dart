import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:commission_art_app2/detail/controller/detail.controller.dart';
import 'package:commission_art_app2/model/order_model.dart'; 

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pesanan'),
      ),
      body: GetBuilder<DetailController>( //Menggunakan GetBuilder untuk menghubungkan dengan DetailController
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.orderHistory.length,
            itemBuilder: (context, index) {
              OrderModel order = controller.orderHistory[index]; //Mendapatkan data pesanan berdasarkan indeks
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  title: Text(
                    'ID Pesanan: ${order.id}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Nama Pemesan: ${order.namaPemesan}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Jumlah Item: ${order.jumlahItem}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Total Harga: Rp ${order.totalHarga.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      // Tambahkan detail lain sesuai kebutuhan
                    ],
                  ),
                  // trailing: Icon(Icons.keyboard_arrow_right),
                  // onTap: () {
                  //   // Implementasi untuk menavigasi ke detail pesanan jika diperlukan
                  // },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
