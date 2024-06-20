import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX library
import 'package:commission_art_app2/detail/controller/detail.controller.dart';
import 'package:commission_art_app2/screens/riwayat_pesanan.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DetailController _detailController = Get.find();

  String _namaPemesan = '';
  int _jumlahItem = 1;
  double _totalHarga = 0.0;
  String _artTitle = ''; // Default art title
  double _selectedProductPrice = 0.0;

  final Map<String, double> _productPrices = {
    'Digital Art - Halfbody - by Jasmine': 100000,
    'Digital Art - Halfbody - by Dailymochi': 120000,
    'Digital Art - Halfbody - by Bluedaisya': 110000,
    'Digital Art - Fullbody - by Dailymochi': 180000,
    'Digital Art - Halfbody - by Hatsuu_t': 90000,
    'Digital Art - Halfbody - by Hatsuu-t': 90000,
    'Illustration - Halfbody - by Cicigaleri': 100000,
    'Illustration - Halfbody - by drimixiuu': 90000,
    'Illustration - Halfbody - by Trayofclouds': 110000,
    'Illusration - Halfbody - by Cicigaleri': 100000,
    'Illustration - Halfbody - by drimixiuu': 90000,
    'llustration - Halfbody - by Trayofclouds': 110000,
    'Painting - Cat - by Belinay': 120000,
    'Painting - Dog - by Taller Pintura': 130000,
    'Painting - Flower - by Amanda': 110000,
    'Painting - Whale - by Taller Pintura': 100000,
    'Painting - Scenery - by Amanda': 150000,
    'Painting - Swanlake - by Belinay': 150000,
    'Sketch - Girl with bird - Claudia': 60000,
    'Sketch - Indian Girl - Claudia': 100000,
    'Sketch - Cat - Daninuara': 110000,
    'Sketch - Girl - Emma oliviya': 100000,
    'Sketch - Town - Daninuara': 110000,
    'Sketch - Dog - Emma oliviya': 1100000,
  };


  //Menampilkan pop up Komfirmasi Pesanan
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pesanan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/check-mark.png', // Ganti dengan path gambar Anda
                height: 100, // Sesuaikan ukuran gambar
                width: 100,
              ),
              SizedBox(height: 10),
              Text('Pesanan Anda sudah berhasil dilakukan'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.blueGrey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement the logic to cancel the order if needed
                // For now, we just close the dialog
              },
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pemesanan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // kunci form untuk validasi dan pengelolaan state form
            child: GetBuilder<DetailController>(
              init: _detailController, // Menginisialisasikan DetailController
              builder: (controller) {
                final product = controller.productModel.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama Pemesan',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) { //validator untuk memeriksa nilai input
                        if (value == null || value.isEmpty) {
                          return 'Nama pemesan tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _namaPemesan = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    DropdownButtonFormField<String>(
                      value: _artTitle.isEmpty ? null : _artTitle,
                      decoration: InputDecoration(
                        labelText: 'Kategori produk',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _artTitle = newValue!;
                          _selectedProductPrice =
                              _productPrices[_artTitle] ?? 0.0;
                          _totalHarga = _jumlahItem * _selectedProductPrice;
                        });
                      },
                      items: _productPrices.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Jumlah Item',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.parse(value) <= 0) {
                          return 'Jumlah item harus angka dan lebih dari 0';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _jumlahItem = int.parse(value);
                          _totalHarga = _jumlahItem * _selectedProductPrice;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        color:
                            Colors.grey.shade200, // Ubah warna sesuai keinginan
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Harga per Item: Rp$_selectedProductPrice',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: 10.0),
                              Text('Total Harga: Rp$_totalHarga',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                              // SizedBox(height: 10.0),
                              // Image.asset(
                              //   'assets/product_image.jpg', // Ganti dengan path gambar produk Anda
                              //   height: 200, // Sesuaikan ukuran gambar
                              //   width: double.infinity,
                              //   fit: BoxFit.cover,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _detailController.createOrder(
                                namaPemesan: _namaPemesan,
                                artTitle: _artTitle,
                                jumlahItem: _jumlahItem,
                                totalHarga: _totalHarga,
                              );

                              // Show confirmation dialog
                              _showConfirmationDialog();

                              // Clear form after submit
                              _formKey.currentState!.reset();
                              setState(() {
                                _jumlahItem = 1;
                                _totalHarga = 0.0;
                                _artTitle = '';
                                _selectedProductPrice = 0.0;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(138, 218, 178, 1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text('Pesan'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OrderHistoryPage()),
          );
        },
        child: Icon(Icons.history),
        backgroundColor: Color.fromRGBO(138, 218, 178, 1),
      ),
    );
  }
}
