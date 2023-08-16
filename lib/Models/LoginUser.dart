// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<LoginUser> userFromJson(String str) => List<LoginUser>.from(json.decode(str).map((x) => LoginUser.fromJson(x)));

String userToJson(List<LoginUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginUser {
  int id;
  String name;
  String email;
  String password;

  LoginUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
  };
}
