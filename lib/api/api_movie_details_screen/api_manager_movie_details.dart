import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_movie_details_screen/api_constant.dart';

import 'package:movie_app/model/movie_details_response.dart';

class ApiManagerMovieDetails {
  static Future<MovieDeateailsResponse?> getMovieDetails(int movieId) async {
    try {
      final url = Uri.parse(
        "${ApiConstant.baseUrl}${ApiConstant.endPoint}?movie_id=$movieId&with_images=true&with_cast=true",
      );
      print("Final URL: $url");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return MovieDeateailsResponse.fromJson(jsonData);
      } else {
        throw Exception("Failed to load movie details");
      }
    } catch (e) {
      MovieDeateailsResponse(statusMessage: 'faild req.');
    }
  }

  static Future<Movie?> getMoviesList(int movieId) async {
    try {
      Uri url = Uri.parse('https://yts.mx/api/v2/list_movies.json?limit=20');
      final response = await http.get(url);
      final jsonData = jsonDecode(response.body);
      return Movie.fromJson(jsonData);
    } catch (e) {
      throw e.toString();
    }
  }
}
