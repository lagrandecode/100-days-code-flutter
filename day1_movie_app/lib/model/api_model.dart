class Movie {
  String title;
  String? image;
  String? director;
  String? rating;
  String? duration;
  late double price;

  Movie(
      {required this.title,
      required this.image,
      required this.director,
      required this.rating,
      required this.duration,
      required this.price});

  factory Movie.fromJson(Map<String,dynamic> json)=>Movie(
      title: json['title'],
      image: json['image'],
      director: json['director'],
      rating: json['rating'],
      duration: json['duration'],
      price: double.tryParse(json['price'].toString()) ?? 0.0
  );
}
