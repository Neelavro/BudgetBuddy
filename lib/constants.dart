

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double sunAmount  = 0;
double monAmount  = 0;
double tueAmount  = 0;
double wedAmount  = 0;
double thurAmount  = 0;
double friAmount  = 0;
double satAmount  = 0;

double sunIncomeAmount  = 0;
double monIncomeAmount  = 0;
double tueIncomeAmount  = 0;
double wedIncomeAmount  = 0;
double thurIncomeAmount  = 0;
double friIncomeAmount  = 0;
double satIncomeAmount  = 0;


List allexpenseincomeMap =[
];
ValueNotifier<String> UserName =ValueNotifier("");

ValueNotifier<String> UserEmail =ValueNotifier("");
ValueNotifier<String> UserPass =ValueNotifier("");
ValueNotifier<int> UserId =ValueNotifier(1);
ValueNotifier<String> goal1 =ValueNotifier("");
ValueNotifier<bool> goal_reached_notification =ValueNotifier(false);
ValueNotifier<bool> goal_exceeded_notification =ValueNotifier(false);
ValueNotifier<int> goal =ValueNotifier(0);


Map<String, List> selectedExpenseMap = {};
Map<String, List<String>> expenseMap1 = {};
Map<String, List> incomeMap = {};
bool toggle = false;

List<Map> accumulatedExpense = [];

goal_notification(int goal, int total ){
  if(goal >= total*.9 && goal < total ){

    goal_reached_notification.value = true;
    print(goal_reached_notification.value);
    return goal_reached_notification.value;
  }
  if(goal > total){
    goal_exceeded_notification.value = true;
    return goal_exceeded_notification.value;

  }
}

eventLoader(List expenseMap){
  selectedExpenseMap = {};
  //Map<String, List> selectedExpenseMap = {};
  for(int i =0; i < expenseMap.length;i++){
    String key  = expenseMap[i]["date"].toString().substring(0,10);
    int value = expenseMap[i]["payment"];
    if (selectedExpenseMap.containsKey(key)){
      selectedExpenseMap[key]!.add(value);
    }
    else{
      selectedExpenseMap[key] = [value];
    }
  }
  //print(selectedExpenseMap);
  return selectedExpenseMap;
}


 weekdayExpenseAmount(String date, String payment) {
  String inputDate = "2023-08-15";
  DateTime dateTime = DateTime.parse(date);

  String weekday = getWeekday(dateTime);
  if(weekday == "Monday"){
    monAmount = monAmount+ double.parse(payment);
    return monAmount;
  }
  if(weekday == "Sunday"){
    sunAmount = sunAmount+ double.parse(payment);
    return sunAmount;
  }if(weekday == "Tuesday"){
    tueAmount = tueAmount+ double.parse(payment);
    return tueAmount;
  }if(weekday == "Wednesday"){
    wedAmount = wedAmount+ double.parse(payment);
    return wedAmount;
  }if(weekday == "Thursday"){
    thurAmount = thurAmount+ double.parse(payment);
    return thurAmount;
  }if(weekday == "Friday"){
    friAmount = friAmount+double.parse(payment);
    return friAmount;
  }if(weekday == "Saturday"){
    satAmount = satAmount+ double.parse(payment);
    return satAmount;
  }
}

weekdayIncomeAmount(String date, String payment) {
  String inputDate = "2023-08-15";
  DateTime dateTime = DateTime.parse(date);

  String weekday = getWeekday(dateTime);
  if(weekday == "Monday"){
    monIncomeAmount = monIncomeAmount+ double.parse(payment);
    return monIncomeAmount;
  }
  if(weekday == "Sunday"){
    sunIncomeAmount = sunIncomeAmount+ double.parse(payment);
    return sunIncomeAmount;
  }if(weekday == "Tuesday"){
    tueIncomeAmount = tueIncomeAmount+ double.parse(payment);
    return tueIncomeAmount;
  }if(weekday == "Wednesday"){
    wedIncomeAmount = wedIncomeAmount+ double.parse(payment);
    return wedIncomeAmount;
  }if(weekday == "Thursday"){
    thurIncomeAmount = thurIncomeAmount+ double.parse(payment);
    return thurIncomeAmount;
  }if(weekday == "Friday"){
    friIncomeAmount = friIncomeAmount+double.parse(payment);
    return friIncomeAmount;
  }if(weekday == "Saturday"){
    satIncomeAmount = satIncomeAmount+ double.parse(payment);
    return satIncomeAmount;
  }
}

String getWeekday(DateTime date) {
  final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  int dayIndex = date.weekday - 1;
  return weekdays[dayIndex];
}



String total_balance = "0";

void addExpensse(Map){
  allexpenseincomeMap.add(Map);
}
void addIncome(Map){
  allexpenseincomeMap.add(Map);
}
void removeTransaction(Map){
  allexpenseincomeMap.remove(Map);
}


ValueNotifier<int> expense =ValueNotifier(0);
ValueNotifier<int> total =ValueNotifier(0);

ValueNotifier<int> income =ValueNotifier(0);


totalExpenses(){
  int sum_of_expenses = 0;
  for(int i = 0; i < allexpenseincomeMap.length; i++){
    if(allexpenseincomeMap[i]["type"] == "Expense"){
      int y = allexpenseincomeMap[i]["payment"];
      sum_of_expenses += y;
    }

  }
  print(sum_of_expenses);
  total.value = total.value - sum_of_expenses;
  expense.value= sum_of_expenses;
}

totalIncome(){
  int sum_of_income = 0;
  for(int i = 0; i < allexpenseincomeMap.length; i++){
    if(allexpenseincomeMap[i]["type"] == "Income"){
      print(allexpenseincomeMap[i]["payment"]);
      int x = allexpenseincomeMap[i]["payment"];
      sum_of_income += x;
    }

  }
  print(sum_of_income);
  total.value = total.value + sum_of_income;
  income.value= sum_of_income;

}

Color primarycolor = Color(0xff438883);
Color secondarycolor = Color(0xff63B5AF);







expenseTracker(List IncomeexpenseMap){
  //Map<String, List> selectedExpenseMap = {};
  for(int i =0; i < IncomeexpenseMap.length;i++){
    if( IncomeexpenseMap[i]["type"] == "Expense" ){
      String key  = IncomeexpenseMap[i]["date"];
      String value = IncomeexpenseMap[i]["payment"].toString();
      if (expenseMap1.containsKey(key)){
        weekdayExpenseAmount(key.toString().substring(0,10), value);
        expenseMap1[key]!.add(value);
      }
      else{
        weekdayExpenseAmount(key.toString().substring(0,10), value);
      expenseMap1[key] = [value];
      }
    }
  }
  print(expenseMap1);
  return expenseMap1;
}


incomeTracker(List IncomeexpenseMap){
  for(int i = 0; i < IncomeexpenseMap.length;i++){
    if( IncomeexpenseMap[i]["type"] == "Income" ){
      String key  = IncomeexpenseMap[i]["date"];
      String value = IncomeexpenseMap[i]["payment"].toString();
      if (incomeMap.containsKey(key)){
        weekdayIncomeAmount(key.toString().substring(0,10), value);
        incomeMap[key]!.add(value);
      }
      else{
        weekdayIncomeAmount(key.toString().substring(0,10), value);
        incomeMap[key] = [value];
      }
    }
  }
  print(incomeMap);
  return incomeMap;
}
