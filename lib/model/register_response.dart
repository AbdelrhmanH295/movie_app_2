class RegisterResponse {
  String? message;
  UserData? data;

  RegisterResponse({required this.message, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;

    return map;
  }
}
