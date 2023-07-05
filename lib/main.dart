import 'package:flutter/material.dart';

import 'RouteGenerator.dart';
final navigatorKey = GlobalKey<NavigatorState>();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BudgetBuddy",
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.allRoutes,
      initialRoute: '/splashScreen'
      ,
    );
  }
}

