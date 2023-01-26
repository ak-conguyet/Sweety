
class Product{

  final String name;
  final String description;
  final List<String> sizeOtp;
  final List<String> otp;
  final String calories;
  final String time;
  final double rating;
  final double prices;
  final String image;
  final bool isFavorite;

  const Product({
    required this.name,required this.description, 
    required this.sizeOtp,
    required this.otp,
    required this.calories,
    required this.time,
    required this.rating,
    required this.prices,
    required this.image,
    this.isFavorite : false,
    });

}