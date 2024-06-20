import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollectionConstants {
  static CollectionReference getProductCollection() {
    return FirebaseFirestore.instance.collection("products");
  }

  static CollectionReference getRiwayatCollection() {
    return FirebaseFirestore.instance.collection("riwayat");
  }

  static CollectionReference getUserCollection() {
    return FirebaseFirestore.instance.collection("users");
  }

  static CollectionReference getBookmarkCollection() {
    return FirebaseFirestore.instance.collection("Bookmark");
  }
}
