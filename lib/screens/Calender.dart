import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import 'AddIncome.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
   String currentDate = '';

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Calendar Example'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
          TableCalendar(
          focusedDay: _focusedDay, firstDay: DateTime(2000), lastDay: DateTime(2222),
          calendarFormat: _calendarFormat,
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDate, selectedDay)) {
              // Call `setState()` when updating the selected day
              setState(() {
                _selectedDate = selectedDay;
                _focusedDay = focusedDay;
                currentDate = _selectedDate.toString().substring(0,10);
                print(currentDate);

              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },

        ),

        Container(
          height: MediaQuery.of(context).size.height*.5,
          width: MediaQuery.of(context).size.width,
          child:ListView.builder(
            //reverse: true,
            //physics: NeverScrollableScrollPhysics(),
            itemCount: expenseMap.length,
            itemBuilder: (context, index){
              return currentDate.toString() == expenseMap[index]['date'] ? Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      expenseMap[index]['type'] == "expense"? Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("-", style: TextStyle(
                            color: Colors.red,fontSize: 50)),
                      ) : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("+", style: TextStyle(
                            color: Colors.green,fontSize: 25)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text("Category Name: ${ expenseMap[index]['categoryName']}",
                            style: TextStyle(
                                color: Colors.black,fontSize: 16)
                            ,),
                          Text("Payment : ${ expenseMap[index]['payment']}",
                            style: TextStyle(
                                color: Colors.black,fontSize: 16)
                            ,),
                        ],
                      ),
                    ],
                  ),
                ),
              ):Container();
            },
          ),
        )
        ]
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async { bool x = await  Navigator.push(context, MaterialPageRoute(builder: (context) => AddIncome(currentDate)));},
        backgroundColor: Colors.red,
          child: Icon(Icons.add),
      ),
    );
  }
}
