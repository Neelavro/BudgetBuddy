import 'package:budget_buddy/screens/AddExpense.dart';
import 'package:budget_buddy/screens/AddIncome.dart';
import 'package:budget_buddy/screens/TransactionHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import 'Calender.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentDate = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalExpenses();
    totalIncome();
    _selectedDate = _focusedDay;
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
          title: Text(
          "Budget Budddy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
          ),
          ),
        ),
        body: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text("${total.value}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Income",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(x == false?"BDT${income.value}" :"BDT${income.value}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Expense",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(x == false?"BDT${expense.value}" :"BDT${expense.value}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                //
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 350,
                    width: 400,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
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
                    child: TableCalendar(
                        focusedDay: _focusedDay, firstDay: DateTime(2000), lastDay: DateTime(2222),
                      calendarFormat: _calendarFormat,
                      onDaySelected: (selectedDay, focusedDay) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventCalendarScreen()));
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDate, day);
                      },

                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      child: Text("Transaction History:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {expense.value = await  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionHistory()));
                        setState(() {
                        });
                        },
                      child: Padding(
                        padding: EdgeInsets.only(top: 20,bottom: 20),
                        child: Text("See all",
                          style: TextStyle(
                            color: primarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height *.4,
                  child: ListView.builder(
                    //reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: expenseMap.length,
                      itemBuilder: (context, index){
                        return expenseMap.length == 0? Container(): Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10),
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
                                  expenseMap[index]["type"] == "expense"?
                                  Text("-${expenseMap[index]["payment"]} BDT",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  ):Text("+${expenseMap[index]["payment"]} BDT",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ) ,
                                  IconButton(onPressed:(){
                                    if(expenseMap[index]["type"] == "expense"){
                                      //print("expense");
                                      total.value = total.value + int.parse(expenseMap[index]["payment"]);
                                      expense.value = expense.value - int.parse(expenseMap[index]["payment"]);
                                      removeTransaction(expenseMap[index]);
                                      setState(() {});

                                    }
                                    if(expenseMap[index]["type"] == "income"){
                                      //print("income");
                                      total.value = total.value - int.parse(expenseMap[index]["payment"]);
                                      income.value = income.value - int.parse(expenseMap[index]["payment"]);
                                      removeTransaction(expenseMap[index]);
                                      setState(() {
                                      });
                                    }
                                  } ,
                                    icon: Icon(Icons.delete_forever_rounded,color: primarycolor,),
                                  )
                                ],
                              ),

                            ],
                          ),
                        );
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
            bool x = await  Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(_focusedDay.toString().substring(0,10))));
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
