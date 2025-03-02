import 'package:flutter/material.dart';

import '../constants.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
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
                  Text("Add Your Expenses!",style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20),
                        child: Container(
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
                          height: MediaQuery.of(context).size.height*.08,

                          child: TextField(
                            controller: t1,
                            focusNode: _focus,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Payee or item",
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.list_alt_rounded,size: 45,color: Colors.red,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20),
                        child: Container(
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
                          height: MediaQuery.of(context).size.height*.08,

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
                      ),
                      Icon(Icons.attach_money_rounded,size: 45,color: Colors.blue,)
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      print(t1.value.text);
                      print(t2.value.text);
                      addExpensse({"type": "expense", "categoryName" : t1.value.text, "payment" : t2.value.text});
                      expense.value = expense.value + int.parse(t2.value.text);
                      total.value = total.value - int.parse(t2.value.text);
                      Navigator.pop(context,expense.value);

                    },
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: primarycolor,
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
