import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_add_movie_to_favorite/api_favorite_constant.dart';
import 'package:movie_app/api/api_home_screen/api_constant.dart';
import 'package:movie_app/model/add_movie_to_favorite.dart';

class ApiFavoriteManager {
  static Future<AddMovieToFavoriteResponse?> addMovieToFavorite(
      String message, int statusCode) async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiFavoriteConstant.endpoint);
      var response = await http.get(url);
      final responseBody = response.body;
      var json = jsonDecode(responseBody);
      return AddMovieToFavoriteResponse.fromJson(json);
    } catch (e) {
      return AddMovieToFavoriteResponse(
          statusCode: statusCode, message: message);
    }
  }
}
