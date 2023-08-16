import 'package:budget_buddy/Bar_graph/Bar_graph.dart';
import 'package:budget_buddy/constants.dart';
import 'package:flutter/material.dart';


class IncomeSummary extends StatelessWidget {
  const IncomeSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: ExpenseBarGraph(
        maxY: 100,
        sunAmount: sunIncomeAmount,
        monAmount: monIncomeAmount,
        tueAmount: tueIncomeAmount,
        wedAmount: wedIncomeAmount,
        thurAmount: thurIncomeAmount,
        friAmount: friIncomeAmount,
        satAmount: satIncomeAmount,

      ),
    );
  }
}

