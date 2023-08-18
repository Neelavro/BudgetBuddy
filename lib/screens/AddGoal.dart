import 'package:budget_buddy/constants.dart';
import 'package:flutter/material.dart';

class AddGoal extends StatefulWidget {
  const AddGoal({Key? key}) : super(key: key);

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  final setGoalController = TextEditingController();
  addGoal() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add a Goal',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: setGoalController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Daily Expense',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Goal'),
            onPressed: () {
              toggle = true;
              goal1.value = setGoalController.value.text;
              goal_notification(int.parse(setGoalController.value.text), expense.value);
              setState(() {
              });
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(10.0),
          child: Column(
            children: [
              toggle == false?
              Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      addGoal();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: primarycolor
                      ),
                      child: Text(" Add a Goal ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ) : Container(),
              toggle ==  true?
              Padding(
                padding:  EdgeInsets.only(top: 50.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
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
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Daily Expense Goal: ${setGoalController.value.text} BDT",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 40.0),
                        child: Text("Total Expesnse: ${expense.value} BDT",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 40.0),
                        child: Text("PS: You will be notified on you Home Page when your total expense goes near your goal or exceeds it!",
                          style: TextStyle(
                            color: primarycolor,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }
}
