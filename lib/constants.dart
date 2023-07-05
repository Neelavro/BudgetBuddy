

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map> expenseMap = [
  {"type": "expense", "categoryName" : "Car", "payment" : "100"},
  {"type": "expense","categoryName" : "Grocery", "payment" : "100"},
  {"type": "expense","categoryName" : "Restaurant", "payment" : "100"},
  {"type": "expense","categoryName" : "Travel", "payment" : "100"},
  {"type": "income","categoryName" : "Upwork", "payment" : "1000"},
  {"type": "income","categoryName" : "Bookstrix", "payment" : "1000"},
  {"type": "income","categoryName" : "Upwork", "payment" : "1000"},
  {"type": "expense","categoryName" : "spotify", "payment" : "100"},
  {"type": "expense","categoryName" : "netflix", "payment" : "100"},
];


String total_balance = "20000";

void addExpensse(Map){
  expenseMap.add(Map);
}
void addIncome(Map){
  expenseMap.add(Map);
}
void removeTransaction(Map){
  expenseMap.remove(Map);
}


ValueNotifier<int> sum =ValueNotifier(0);
ValueNotifier<int> total =ValueNotifier(20000);

ValueNotifier<int> income =ValueNotifier(0);


totalExpenses(){
  int sum_of_expenses = 0;
  for(int i = 0; i < expenseMap.length; i++){
    if(expenseMap[i]["type"] == "expense"){sum_of_expenses += int.parse(expenseMap[i]["payment"]);
    }
  }
  print(sum_of_expenses);
  total.value = total.value - sum_of_expenses;
  sum.value= sum_of_expenses;
}

totalIncome(){
  int sum_of_income = 0;
  for(int i = 0; i < expenseMap.length; i++){
    if(expenseMap[i]["type"] == "income"){sum_of_income += int.parse(expenseMap[i]["payment"]);
    }
  }
  print(sum_of_income);
  total.value = total.value + sum_of_income;
  income.value= sum_of_income;

}

Color primarycolor = Color(0xff438883);
Color secondarycolor = Color(0xff63B5AF);

