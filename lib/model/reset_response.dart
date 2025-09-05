class ResetPasswordResponse {
  final String message;
  final ResetPasswordData? data;

  ResetPasswordResponse({
    required this.message,
    this.data,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      message: json["message"] ?? "",
      data: json["data"] != null
          ? ResetPasswordData.fromJson(json["data"])
          : null,
    );
  }
}

class ResetPasswordData {
  final String email;
  final String name;
  final String phone;

  ResetPasswordData({
    required this.email,
    required this.name,
    required this.phone,
  });

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) {
    return ResetPasswordData(
      email: json["email"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
    );
  }
}
