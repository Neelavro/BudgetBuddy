import 'package:budget_buddy/Controller/UserController.dart';
import 'package:budget_buddy/Repositories/UserRepository.dart';
import 'package:budget_buddy/screens/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../Models/User.dart';
import '../constants.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'package:mvc_pattern/mvc_pattern.dart';




class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends StateMVC<SingUp>  {
  late UserController _con;

  _SingUpState() : super(UserController()) {
    /// Acquire a reference to the passed Controller.
    _con = controller as UserController;
  }
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  ScaffoldGradientBackground(
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
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 70.0,left: 10,right: 10),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      prefix: Text("       "),
                      border: InputBorder.none,
                      hintText: "name"
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50.0,left: 10,right: 10),
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
              padding: const EdgeInsets.only(top: 50.0, left: 10,right: 10),
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: confirmpassController,
                  obscureText: true,
                  decoration: const InputDecoration(prefix: Text("       "),
                      border: InputBorder.none,
                      hintText: "Confirm Password"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 55,left: 30,right: 3),
              child: MaterialButton(
                onPressed: ()async{
                  User user = User();
                  user.email = emailController.value.text;
                  user.name = nameController.value.text;
                  user.password = passController.value.text;
                  if (emailController.value.text.isEmpty || nameController.value.text.isEmpty ||
                      passController.value.text.isEmpty || confirmpassController.value.text.isEmpty) {
                    final snackBar = SnackBar(
                      content: const Text(
                          'Please fill the required fields'),
                      backgroundColor: (Colors.black12),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          // Navigator.pushNamed(context,'/signup');
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                 else  if (passController.value.text != confirmpassController.value.text ) {
                    final snackBar = SnackBar(
                      content: const Text(
                          'Passwords do not match'),
                      backgroundColor: (Colors.black12),
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          // Navigator.pushNamed(context,'/signup');
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else{
                    print(user.name);
                    print(user.email);
                    print(user.password);
                    _con.CreateUser(user);
                    //postData(nameController.value.text, emailController.value.text, passController.value.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
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
                    "Create account",
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
                    " Already have an account? go to",
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      " Log in ",
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
    );
  }
}
