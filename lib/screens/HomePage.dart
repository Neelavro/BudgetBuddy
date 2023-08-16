import 'package:budget_buddy/Repositories/ExpenseIncome.dart';
import 'package:budget_buddy/screens/AddExpense.dart';
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
  String currentDate = '';
  bool toggle = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(allexpenseincomeMap);
    totalExpenses();
    totalIncome();
    eventLoader(allexpenseincomeMap);
    currentDate = _focusedDay.toString();
    print(currentDate);
    expenseTracker(allexpenseincomeMap);
    incomeTracker(allexpenseincomeMap);
    _controller = new TabController(length: 3, vsync: this, initialIndex: 0)
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
  DateTime _focusedDay = DateTime.now();
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

                expense.value = expense.value + int.parse(descpController.value.text);
                total.value = total.value - int.parse(descpController.value.text);
                //weekdayExpenseAmount(_selectedDate.toString().substring(0,10), descpController.value.text);
                addExpensse({"userId": UserId.value,"type": "Expense","categoryName": titleController.value.text,"payment": int.parse(descpController.value.text),"date": currentDate});
                eventLoader(allexpenseincomeMap);
                print("currentDate: $currentDate");
                postIncomeExpense(UserId.value, "Expense", titleController.value.text, descpController.value.text, currentDate);
                weekdayExpenseAmount(currentDate.substring(0,10), descpController.value.text);
                getAllIncomeExpense(UserId.value);
                eventLoader(allexpenseincomeMap);
                weekdayExpenseAmount(currentDate.substring(0,10), descpController.value.text);
                //incomeTracker(allexpenseincomeMap);

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
                print(titleController.text);
                print(descpController.text);
                income.value = income.value + int.parse(descpController.value.text);
                total.value = total.value + int.parse(descpController.value.text);
                addIncome({"userId": UserId.value,"type": "Expense","categoryName": titleController.value.text,"payment": int.parse(descpController.value.text),"date": currentDate});
                eventLoader(allexpenseincomeMap);
                postIncomeExpense(UserId.value, "Income", titleController.value.text, descpController.value.text, currentDate);
                weekdayIncomeAmount(currentDate.toString().substring(0,10), descpController.value.text);
                getAllIncomeExpense(UserId.value);

                eventLoader(allexpenseincomeMap);
                _selectedDate = _focusedDay;
                //expenseTracker(allexpenseincomeMap);

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
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    _controller.animateTo(_currentTabIndex);
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
              Text("TRANSACTION HISTORY"),

            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
          MainPage(),
            EventCalendarScreen(),
          TransactionHistory(),


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
