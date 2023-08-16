import 'package:budget_buddy/constants.dart';
import 'package:budget_buddy/screens/Login.dart';
import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondarycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "User Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),

          ],
        ),

      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 100.0),
                child: Container(
                  child: Icon(Icons.person,size: 100,color: primarycolor,),
                ),
              ),
              Text(
                "Name: ${UserName.value}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              Text(
                "Email: ${UserEmail.value}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 400,left:100,right: 0),
                child: Container(
                  width: 200,
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Log out",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                          Icon(Icons.logout,size: 40,),
                        ],
                      )
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
