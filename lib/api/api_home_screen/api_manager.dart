import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_home_screen/api_constant.dart';
import 'package:movie_app/model/movie_response.dart';

class ApiManager {
  static Future<Movie?> getMovies() async {
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endpoint);
    var response = await http.get(url);
    try {
      var responseBody = response.body; // to do : string
      //Todo : String=> json
      var json = jsonDecode(responseBody); // todo : json
      //json=>object
      return Movie.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
//   static Future<List<Movie?>> getMovies() async {
//   Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.endpoint);
//   var response = await http.get(url);

//   try {
//     if (response.statusCode == 200) {
//       var responseBody = response.body;
//       var json = jsonDecode(responseBody);

//       // الوصول لليست اللي جوا "data"
//       List moviesJson = json["data"]["movies"];

//       // تحويل كل عنصر في ليست لموديل Movie
//       return moviesJson.map((e) => Movie.fromJson(e)).toList();
//     } else {
//       throw Exception("Failed to load movies. Status Code: ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error parsing movies: $e");
//   }
// }
}
