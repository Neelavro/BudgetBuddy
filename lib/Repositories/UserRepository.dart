import 'package:budget_buddy/Models/LoginUser.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../Models/User.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:core';


Future UserCreate(User user) async {
  Uri url = Uri.parse("https://4295-103-205-71-145.ngrok-free.app/user/");
  print(url.data);
  bool x = false;
  print(user.email);
  print(user.password);
  http.Response response = await http.post(url, body: {
    "name" : user.name,
      "email" : user.email,
      "password": user.password
  });
  print(response.body);

  return x;
}

getAllUsers() async {
  final response = await http.get(Uri.parse('https://4295-103-205-71-145.ngrok-free.app/api/user/'));
  List result = jsonDecode(response.body);
  print(result);
  return result;

}

getCurrentUser(String email) async {
  final response = await http.get(Uri.parse('https://4295-103-205-71-145.ngrok-free.app/api/user/email/$email'));
  Map result = jsonDecode(response.body);
  UserName.value = result['user']['name'].toString();
  UserEmail.value = result['user']['email'].toString();
  UserPass.value = result['user']['password'].toString();
  UserId.value = result['user']['id'];
  print(UserPass.value);
  print(result['user']['email'].toString());
  return result;

}
Future<void> postData(String x, String y, String z) async {
  final url = Uri.parse('https://4295-103-205-71-145.ngrok-free.app/api/user/');
  final response = await http.post(
    url,
    body: json.encode({
      'name': x,
      'email': y,
      'password' : z,
    }),
    headers: {
      'Content-Type': 'application/json',
    },

  );

  if (response.statusCode == 200) {
    // Successful POST request
    print('Post request successful');
    print('Response: ${response.body}');
  } else {
    // Error in POST request
    print('Failed to make POST request. Status code: ${response.statusCode}');
  }
}