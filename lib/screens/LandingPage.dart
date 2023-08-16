import 'package:budget_buddy/constants.dart';
import 'package:budget_buddy/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../Repositories/ExpenseIncome.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllIncomeExpense(UserId.value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .65,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //color: Colors.blue,
                  image: DecorationImage(
                    image:  AssetImage("assets/Group 2.png"),
                    fit: BoxFit.cover
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/Group 1.png",scale: 1.2,)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Spend Smarter\n Save More",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primarycolor,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*.07,
                    width: MediaQuery.of(context).size.width*.8,
                    decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
