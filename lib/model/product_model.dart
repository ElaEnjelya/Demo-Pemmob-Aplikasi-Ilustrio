class ProductModel {
  String productId;
  String imagePath;
  String artTitle;
  String price;
  double rating;
  String imagePathProfile;
  String artist;
  String category;
  String recomendation;

  ProductModel({
    required this.productId,
    required this.imagePath,
    required this.artTitle,
    required this.price,
    required this.rating,
    required this.imagePathProfile,
    required this.artist,
    required this.category,
    required this.recomendation,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['product_id'] ?? '',
      imagePath: json['imagePath'] ?? '',
      artTitle: json['artTitle'] ?? '',
      price: json['price'] ?? '0',
      rating: json['rating'] ?? 0,
      imagePathProfile: json['imagePathProfile'] ?? '',
      artist: json['artist'] ?? '',
      category: json['category'] ?? '',
      recomendation: json['recomendation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'imagePath': imagePath,
      'artTitle': artTitle,
      'price': price,
      'rating': rating,
      'imagePathProfile': imagePathProfile,
      'artist': artist,
      'category': category,
      'recomendation': recomendation,
    };
  }
}
