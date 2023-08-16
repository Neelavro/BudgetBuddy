
import 'package:flutter/material.dart';

import '../constants.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  int mapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(allexpenseincomeMap.length == 0){
          print("0");
          Navigator.pop(context, expense.value);
        }
        else if(allexpenseincomeMap[mapIndex]["type"] == "income"){
          Navigator.pop(context, income.value);
        }
        else if(allexpenseincomeMap[mapIndex]["type"] == "expense") {
          Navigator.pop(context, expense.value);
        }
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.only(left: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height *.8,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: allexpenseincomeMap.length,
              itemBuilder: (context, index){
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(allexpenseincomeMap[index]["categoryName"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              allexpenseincomeMap[index]["type"] == "Expense"?
                              Text("-${allexpenseincomeMap[index]["payment"]} BDT",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ):Text("+${allexpenseincomeMap[index]["payment"]} BDT",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                ),
                              ) ,
                              IconButton(onPressed:(){
                                if(allexpenseincomeMap[index]["type"] == "Expense"){
                                  //print("expense");
                                  total.value = total.value + int.parse(allexpenseincomeMap[index]["payment"]);
                                  expense.value = expense.value - int.parse(allexpenseincomeMap[index]["payment"]);
                                  removeTransaction(allexpenseincomeMap[index]);
                                  setState(() {
                                  });
                                }
                                if(allexpenseincomeMap[index]["type"] == "Income"){
                                  //print("income");
                                  total.value = total.value - int.parse(allexpenseincomeMap[index]["payment"]);
                                  income.value = income.value - int.parse(allexpenseincomeMap[index]["payment"]);
                                  removeTransaction(allexpenseincomeMap[index]);
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
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
