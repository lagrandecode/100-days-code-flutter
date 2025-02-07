class Movie {
  final String title;
  final String? image;
  final String? director;
  final String? rating;
  final String? duration;
  final double price;

  Movie({
    required this.title,
    this.image,
    this.director,
    this.rating,
    this.duration,
    required this.price,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'Unknown Title',
      image: json['image'] as String?,
      director: json['director'] as String?,
      rating: json['rating'] as String?,
      duration: json['duration'] as String?,
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
    );
  }
}
