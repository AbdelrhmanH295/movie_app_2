import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_register_screen/api_constant.dart';
import 'package:movie_app/model/register_response.dart';

class ApiManager {
  Future<UserResponse?> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phone,
  ) async {
    Uri url = Uri.parse('${ApiConstant.baseUrl}auth/login');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "phone": phone,
          "avaterId": 1
        
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // json
      return UserResponse.fromJson(data);
    } else {
      return UserResponse(message: 'Register failed ${response.statusCode}');
    }
  }
}
