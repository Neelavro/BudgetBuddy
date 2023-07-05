import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int income = 2000;
  Widget totalExpenses(){
    int sum_of_expenses = 0;
    int result = 0;
    for(int i = 0; i < expenseMap.length; i++){
      print(sum_of_expenses);
      sum_of_expenses += int.parse(expenseMap[i]["expense"]);
      print(sum_of_expenses);
    }
    result = income - sum_of_expenses;
    return Text("$result",style: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
        "Budget Budddy",
            style: TextStyle(
              color: Colors.white
        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("income",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text("2000 BDT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Text("Expenses:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height *.6,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: expenseMap.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(5),
                          width:MediaQuery.of(context).size.width*.8 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow:  [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  0,
                                  2.0,
                                ),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(expenseMap[index]["categoryName"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(expenseMap[index]["expense"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  IconButton(onPressed:(){expenseMap.remove(expenseMap[index]);
                                  setState(() {
                                  });
                                  } ,
                                    icon: Icon(Icons.delete_forever_rounded),
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                ),
              ),
             Padding(
               padding:  EdgeInsets.only(top: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Money left:",
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 20,
                     ),
                   ),
                   totalExpenses(),
                 ],
               ),
             ),
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                        onPressed: (){
                      //addExpensse({"categoryName" : "Car", "expense" : "100"});
                      Navigator.pushNamed(context, "/addExpense");
                      setState(() {
                      });
                    },
                      child: Icon(Icons.add),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
