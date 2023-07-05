import 'package:budget_buddy/screens/AddExpense.dart';
import 'package:budget_buddy/screens/HomePage.dart';
import 'package:budget_buddy/screens/nothingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {

  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context)
    {
      switch (settings.name) {
        case "/homePage":
          return HomePage();
        case "/addExpense":
          return AddExpense();
      }
      return nothingPage();
      // need to change to error page

  });
  }
}