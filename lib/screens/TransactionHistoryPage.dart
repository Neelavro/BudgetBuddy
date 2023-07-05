
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        leading: InkWell(
          onTap: (){
            if(expenseMap[mapIndex]["type"] == "income"){
              Navigator.pop(context, income.value);
            }
            else{
              Navigator.pop(context, sum.value);
            }

            print("asd");
            print(sum.value);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Transaction History"),
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height *.8,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: expenseMap.length,
            itemBuilder: (context, index){
              return Padding(
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
                            sum.value = sum.value - int.parse(expenseMap[index]["payment"]);
                            removeTransaction(expenseMap[index]);
                          }
                          if(expenseMap[index]["type"] == "income"){
                            //print("income");
                            total.value = total.value - int.parse(expenseMap[index]["payment"]);
                            income.value = income.value - int.parse(expenseMap[index]["payment"]);
                            removeTransaction(expenseMap[index]);
                          }
                          setState(() {
                          });
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
      ),
    );
  }
}
