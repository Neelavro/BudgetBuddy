import 'package:budget_buddy/screens/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../constants.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage()));
  }
  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient:  LinearGradient(
        colors: [secondarycolor, primarycolor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.00001,0.5],
        tileMode: TileMode.repeated,
      ),
      body: Center(
        child: Text(
          "BudgetBuddy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
