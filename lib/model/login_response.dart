class LoginResponse {
  String message;
  String? data;
  LoginResponse({required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"] ?? "",
      data: json["data"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"message": message, "data": data};
  }
}
