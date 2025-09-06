import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  String? message;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? avaterId;

  UserResponse({
    this.message,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.avaterId,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        message: json["message"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        phone: json["phone"],
        avaterId: json["avaterId"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avaterId,
      };
}
