import 'package:budget_buddy/Bar_graph/Bar_graph.dart';
import 'package:budget_buddy/constants.dart';
import 'package:flutter/material.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({Key? key}) : super();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: ExpenseBarGraph(
        maxY: 100,
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount,

      ),
    );
  }
}
