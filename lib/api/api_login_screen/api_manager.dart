import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_login_screen/api-constant.dart';
import 'package:movie_app/api/shared_prefrence/shared_preferences.dart';
import 'package:movie_app/model/login_response.dart';

class ApiManager {
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/auth/login');
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return LoginResponse.fromJson(data);
    } else {
      return LoginResponse(message: "Login Failed", data: null);
    }
  }
}

/*
  static Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiEndpoints.login}");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    print("API Response: ${response.body}");

    final jsonResponse = json.decode(response.body);
    return LoginResponse.fromJson(jsonResponse);

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(responseData);
    } else {
      throw Exception(responseData["message"] ?? "Login failed, try again.");
    }
  }

  static Future<RegisterResponse> register(
    String email,
    String name,
    String password,
    String confirmPassword,
    String phone,
    int avaterId,
  ) async {
    Uri url = Uri.https(ApiConstants.BaseUrl, ApiEndpoints.register);

    var data = {
      "email": email,
      "name": name,
      "password": password,
      "confirmPassword": confirmPassword,
      "phone": phone,
      "avaterId": avaterId,
    };

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var json = jsonDecode(response.body);
        return RegisterResponse.fromJson(json);
      } else {
        var json = jsonDecode(response.body);
        throw Exception(json["message"] ?? "Registration failed");
      }
    } catch (e) {
      throw Exception("Error while registering: $e");
    }
  }*/