import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_home_screen/api_constant.dart';
import 'package:movie_app/model/reset_response.dart';

class ApiManager {
  static Future<ResetPasswordResponse?> resetPassword(
      String newPassword, String oldPassword) async {
    Uri url = Uri.parse(
     'https://yts.mx/auth/reset-password',
    );
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {"oldPassword": oldPassword, "newPassword": newPassword}));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ResetPasswordResponse.fromJson(data);
    } else {
      return ResetPasswordResponse(
          message: ' Reset passwor faild  ${response.statusCode}');
    }
  }
}
