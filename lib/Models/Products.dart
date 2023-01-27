
class Product{

  final String id;
  final String name;
  final String description;
  final List<String> sizeOtp;
  final List<String> otp;
  final String calories;
  final String time;
  final double rating;
  final double prices;
  final String image;
  bool isFavorite;
  int count;

   Product({
    required this.id,
    required this.name,required this.description, 
    required this.sizeOtp,
    required this.otp,
    required this.calories,
    required this.time,
    required this.rating,
    required this.prices,
    required this.image,
    this.isFavorite : false,
    this.count = 0
    });

}