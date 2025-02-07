import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/api_model.dart';

class ApiService {
  static const String baseUrl = 'https://movie3-d7a456930263.herokuapp.com/';

  Future<List<Movie>> fetchMovie() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
