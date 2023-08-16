


import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';


getAllIncomeExpense(int id) async {
  final response = await http.get(Uri.parse('https://4295-103-205-71-145.ngrok-free.app/api/inex/user/$id'));
  List result = jsonDecode(response.body);
  allexpenseincomeMap = result;
  print(result);
  return result;
}

Future<void> postIncomeExpense(int y, String p, String q, String r, String s) async {
  final url = Uri.parse('https://4295-103-205-71-145.ngrok-free.app/api/inex/');
  int z = int.parse(r);
  final response = await http.post(
    url,
    body: json.encode({
      "userId": y,
      "type": p,
      "categoryName": q,
      "payment": z,
      "date": s
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