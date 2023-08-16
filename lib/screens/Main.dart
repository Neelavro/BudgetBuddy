import 'package:budget_buddy/widgets/ExpenseSummary.dart';
import 'package:budget_buddy/widgets/IncomeSummary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';
import 'Calender.dart';
import 'TransactionHistoryPage.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TabController _controller;
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
  void initState() {
    // TODO: implement initState
    super.initState();
  ;_selectedDate = _focusedDay;
    print(_focusedDay);
    setState(() {
    });

  }
  List _listOfDayEvents(DateTime dateTime) {
    if (selectedExpenseMap[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return selectedExpenseMap[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              padding:  EdgeInsets.only(left: 20.0,top: 20,bottom: 10),
              child: Text("Daily Expense Summary",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 0.0),
              child: ExpenseSummary(),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0,top: 20,bottom: 10),
              child: Text("Daily Income Summary",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 10.0),
              child: IncomeSummary(),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 20.0),
              child: Container(
                height: 390,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20.0,top: 10),
                      child: Text("Calender",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    TableCalendar(
                      focusedDay: _focusedDay, firstDay: DateTime(2000), lastDay: DateTime(2222),
                      calendarFormat: _calendarFormat,
                      onDaySelected: (selectedDay, focusedDay) {
                        _controller.animateTo(2);
                        setState(() {

                        });
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => EventCalendarScreen()));
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDate, day);
                      },
                      eventLoader: _listOfDayEvents,

                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
