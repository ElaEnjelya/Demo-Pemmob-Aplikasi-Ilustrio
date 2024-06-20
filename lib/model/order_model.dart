import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String id;
  final String namaPemesan;
  final int jumlahItem;
  final String artTitle;
  final double totalHarga;

  OrderModel({
    required this.id,
    required this.namaPemesan,
    required this.jumlahItem,
    required this.artTitle,
    required this.totalHarga,
  });

  // Convert to map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaPemesan': namaPemesan,
      'jumlahItem': jumlahItem,
      'totalHarga': totalHarga,
      'artTitle': artTitle,
    };
  }

  // Create OrderModel from Firestore snapshot
  factory OrderModel.from(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      id: doc.id,
      namaPemesan: data['namaPemesan'] ?? '',
      jumlahItem: data['jumlahItem'] ?? 0,
      totalHarga: data['totalHarga'] ?? 0.0,
      artTitle: data['artTitle'] ?? '',
    );
  }
}
