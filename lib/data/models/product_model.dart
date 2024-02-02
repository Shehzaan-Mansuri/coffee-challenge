class ProductModel {
  ProductModel({
    required this.id,
    required this.ratings,
    required this.noOfReviews,
    required this.price,
    required this.title,
    required this.description,
    required this.addons,
    required this.coffeeType,
    required this.image,
  });
  final num ratings, noOfReviews, price, id;
  final String title, description, addons, image, coffeeType;
}
