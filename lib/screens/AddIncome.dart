import 'package:flutter/material.dart';

import '../constants.dart';

class AddIncome extends StatefulWidget {
  String selectedDay;
   AddIncome(this.selectedDay) : super();

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  String expenseType = "addExpense";
  bool toggle = true;
  TextEditingController t1 = new TextEditingController();
  TextEditingController t2 = new TextEditingController();

  FocusNode _focus = new FocusNode();
  FocusNode _focus2 = new FocusNode();
  void _onFocusChange() {
    setState(() {

    });
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }
  @override

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _focus2.addListener(_onFocusChange);


  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus2.removeListener(_onFocusChange);

    _focus.dispose();
    _focus2.dispose();



    @override
    Widget build(BuildContext context) {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add Your Incomes!",style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.only(top:40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                          width: MediaQuery.of(context).size.width*.7,
                          height: MediaQuery.of(context).size.height*.07,

                          child: TextField(
                            controller: t1,
                            focusNode: _focus,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Payee or item",
                            ),
                          ),
                        ),
                       InkWell(onTap:(){

                         setState(() {
                           toggle ? toggle =  false: toggle = true;
                         });
                       },
                           child:  Container(
                             alignment: Alignment.center,
                             color: toggle ==  true? Colors.red: Colors.green,
                             height: 50,
                             width: 50,
                             child: toggle ==  true? Text(
                               "-",style: TextStyle(color: Colors.white,fontSize: 40),):
                             Text("+",style: TextStyle(color: Colors.white,fontSize: 30),
                           )
                       ),
                       )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                          width: MediaQuery.of(context).size.width*.7,
                          height: MediaQuery.of(context).size.height*.07,

                          child: TextField(
                            controller: t2,
                            focusNode: _focus2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.format_indent_decrease),
                              hintText: "0.0",
                            ),
                          ),
                        ),
                        Text("BDT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 20
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print(t1.value.text);
                      print(t2.value.text);
                      toggle == true? addExpensse({"date": widget.selectedDay,"type": "expense", "categoryName" : t1.value.text, "payment" : t2.value.text})
                      :addIncome({"date": widget.selectedDay,"type": "income", "categoryName" : t1.value.text, "payment" : t2.value.text});
                      toggle == true? expense.value = expense.value + int.parse(t2.value.text)
                      :income.value = income.value + int.parse(t2.value.text);
                      toggle == true? total.value = total.value - int.parse(t2.value.text)
                      :total.value = total.value + int.parse(t2.value.text);
                      Navigator.pop(context,toggle);

                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primarycolor ,
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
                        width: MediaQuery.of(context).size.width*.5,
                        height: MediaQuery.of(context).size.height*.06,
                        child: Text("Submit",style: TextStyle(color: Colors.white, fontSize: 20),)
                    ),
                  )
                ],),
            ),
          )
      ),
    );
  }


}
