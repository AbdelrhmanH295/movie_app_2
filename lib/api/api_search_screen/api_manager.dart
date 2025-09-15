import 'dart:convert';

import 'package:movie_app/api/api_home_screen/api_constant.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:http/http.dart' as http;

class ApiManagerr {
  static Future<List<Movies>> getMoviess() async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Movie movieResponse = Movie.fromJson(json);

        // نرجع ليست الأفلام من جوه Data
        return movieResponse.data?.movies ?? [];
      } else {
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}
