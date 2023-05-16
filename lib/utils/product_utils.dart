class product {

  static int addcartproduct = 0;

  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final String thumbnail;
  // final List images;

  product({
    required this.id,
    required this.brand,
    required this.category,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.title,
    // required this.images,
  });

  factory product.fromMap({required Map data}) {
    return product(
      id: data['id'],
      brand: data['brand'],
      category: data['category'],
      description: data['description'],
      price: data['price'],
      thumbnail: data['thumbnail'],
      title: data['title'],
      // images: data['images'],
    );
  }

}
