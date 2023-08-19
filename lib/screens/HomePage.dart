import 'package:budget_buddy/Models/IncomeExpense.dart';
import 'package:budget_buddy/Repositories/ExpenseIncome.dart';
import 'package:budget_buddy/screens/AddExpense.dart';
import 'package:budget_buddy/screens/AddGoal.dart';
import 'package:budget_buddy/screens/AddIncome.dart';
import 'package:budget_buddy/screens/Login.dart';
import 'package:budget_buddy/screens/Main.dart';
import 'package:budget_buddy/screens/TransactionHistoryPage.dart';
import 'package:budget_buddy/screens/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import 'Calender.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  bool toggle = true;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDate = _focusedDay.toString();
    print(allexpenseincomeMap);
    totalExpenses();
    totalIncome();
    eventLoader(allexpenseincomeMap);
    print(currentDate);
    expenseTracker(allexpenseincomeMap);
    incomeTracker(allexpenseincomeMap);
    _controller = new TabController(length: 4, vsync: this, initialIndex: 0)
      ..addListener(() {});
    //print(_focusedDay);
    setState(() {
    });
  }

  // Widget totalExpenses(){
  //   int sum_of_expenses = 0;
  //   int result = 0;
  //   for(int i = 0; i < expenseMap.length; i++){
  //     print(sum_of_expenses);
  //     sum_of_expenses += int.parse(expenseMap[i]["expense"]);
  //     print(sum_of_expenses);
  //   }
  //   result = income - sum_of_expenses;
  //   return Text("BDT$sum_of_expenses",style: TextStyle(
  //     color: Colors.black,
  //     fontSize: 25,
  //   ),);
  // }
  bool value = false;
  bool x = false;
  void updatedExpense(){
    setState(() {
      value = true;
    });
  }
  CalendarFormat _calendarFormat =  CalendarFormat.month;
  //DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  addIncomeOExpense() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add Expense/Income',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Expense/Income',
              ),
            ),
            TextField(
              controller: descpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: '0.0'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Expense'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                IncomeExpense expense_obj = IncomeExpense();
                expense_obj.userId = UserId.value;
                expense_obj.type = "Expense";
                expense_obj.categoryName = titleController.value.text;
                expense_obj.payment = int.parse(descpController.value.text);
                expense_obj.date = currentDate;
                expense.value = expense.value + int.parse(descpController.value.text);
                total.value = total.value - int.parse(descpController.value.text);
                addExpensse({"userId": UserId.value,"type": "Expense","categoryName": titleController.value.text,"payment": int.parse(descpController.value.text),"date": currentDate});
                eventLoader(allexpenseincomeMap);
                print("currentDate: $currentDate");
                postIncomeExpense(expense_obj);
                weekdayExpenseAmount(currentDate.substring(0,10), descpController.value.text);
                eventLoader(allexpenseincomeMap);
                weekdayExpenseAmount(currentDate.substring(0,10), descpController.value.text);
                goal_notification(int.parse(goal1.value), expense.value);
                setState(() {
                });
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          ),
          TextButton(
            child: const Text('Add Income'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                IncomeExpense income_obj = IncomeExpense();
                income_obj.userId = UserId.value;
                income_obj.type = "Income";
                income_obj.categoryName = titleController.value.text;
                income_obj.payment = int.parse(descpController.value.text);
                income_obj.date = currentDate;
                income.value = income.value + int.parse(descpController.value.text);
                total.value = total.value + int.parse(descpController.value.text);
                addIncome({"userId": UserId.value,"type": "Income","categoryName": titleController.value.text,"payment": int.parse(descpController.value.text),"date": currentDate});
                print(currentDate);
                eventLoader(allexpenseincomeMap);
                postIncomeExpense(income_obj);
                weekdayIncomeAmount(currentDate.toString().substring(0,10), descpController.value.text);
                eventLoader(allexpenseincomeMap);
                setState(() {
                });
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: secondarycolor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              "Budget Budddy",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
              ),
              ),
              Container(
                width: 50,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                    child: Icon(Icons.person,size: 40,)
                ),
              ),
            ],
          ),
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Text("MAIN"),
              Text("CALENDER"),
              Text("Balence Sheet"),
              Text("GOALS"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
          MainPage(),
            EventCalendarScreen(),
          TransactionHistory(),
            AddGoal(),
        ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            addIncomeOExpense();
            //bool x = await  Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(_focusedDay.toString().substring(0,10))));
            setState(() {
            });
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
