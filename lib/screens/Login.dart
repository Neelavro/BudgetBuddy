import 'package:budget_buddy/screens/LandingPage.dart';
import 'package:budget_buddy/screens/SingnUp.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../Controller/UserController.dart';
import '../Repositories/UserRepository.dart';
import '../constants.dart';
import 'HomePage.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login>  {
  late UserController _con;

  _LoginState() : super(UserController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as UserController;
  }
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: ScaffoldGradientBackground(
        gradient:  LinearGradient(
          colors: [primarycolor, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.00001,1],
          tileMode: TileMode.repeated,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:30,top: 80.0),
                child: Text(
                  "BudgetBuddy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:30,top: 30),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 100.0,left: 10,right: 10),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(

                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefix: Text("       "),
                      border: InputBorder.none,
                      hintText: "Email"
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10,right: 10),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(prefix: Text("       "),
                        border: InputBorder.none,
                        hintText: "Password"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55,left: 30,right: 30),
                child: MaterialButton(
                  onPressed: ()async {
                    //_con.getcurrentUser(emailController.value.text);

                    //var x  = await getCurrentUser(emailController.value.text);

                    if (emailController.value.text.isEmpty ||
                        passController.value.text.isEmpty) {
                      final snackBar = SnackBar(
                        content:  Text(
                            'Please fill the required fields', style: TextStyle(color: primarycolor),),
                        backgroundColor: (Colors.white),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            // Navigator.pushNamed(context,'/signup');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    var x  = await _con.getcurrentUser(emailController.value.text);
                    if (UserEmail.value != emailController.value.text ||
                        UserPass.value != passController.value.text) {
                      final snackBar = SnackBar(
                        content:  Text(
                            'Incorrect email or password' ,style: TextStyle(color: primarycolor)),
                        backgroundColor: (Colors.white),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {
                            // Navigator.pushNamed(context,'/signup');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (UserEmail.value == emailController.value.text &&
                        UserPass.value == passController.value.text) {
                      print("success");
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => LandingPage()));
                    }

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
                      "log in",
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02, horizontal: MediaQuery.of(context).size.width*.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Don't have an account?",
                      ),
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SingUp()));
                      },
                      child: Text(
                        " Create an account",
                        style: TextStyle(
                          color: primarycolor
                        ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
