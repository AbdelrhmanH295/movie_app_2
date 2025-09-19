import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_suggestion/api_constant.dart';
import 'package:movie_app/model/movie_response.dart';

class ApiManager {
  static Future<Movie?> getMovieSuggestion(int movieId) async {
    try {
      Uri url = Uri.parse('${ApiConstant.baseUrl}${ApiConstant.endPoint}?movie_id=$movieId');
    var response = await http.get(url);
    var dataJason = jsonDecode(response.body);
    return Movie.fromJson(dataJason);
    } 
    catch (e) {
      throw e;
    }
  }
}
