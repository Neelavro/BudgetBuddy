


import 'dart:convert';

import 'package:budget_buddy/Models/IncomeExpense.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';


getAllIncomeExpense(int id) async {
  final response = await http.get(Uri.parse('https://27d9-103-205-71-145.ngrok-free.app/api/inex/user/$id'));
  List result = jsonDecode(response.body);
  allexpenseincomeMap = result;
  print(result);
  return result;
}

Future<void> postIncomeExpense(IncomeExpense incomeexpense) async {
  final url = Uri.parse('https://27d9-103-205-71-145.ngrok-free.app/api/inex/');
  //int z = int.parse(r);
  final response = await http.post(
    url,
    body: json.encode({
      "userId": incomeexpense.userId,
      "type": incomeexpense.type,
      "categoryName": incomeexpense.categoryName,
      "payment": incomeexpense.payment,
      "date": incomeexpense.date
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