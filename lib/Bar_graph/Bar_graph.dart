import 'package:budget_buddy/Bar_graph/Bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseBarGraph extends StatelessWidget {
  final double maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;


   ExpenseBarGraph({ required this.maxY,
     required this.sunAmount,
     required this.monAmount,
     required this.tueAmount,
     required this.wedAmount,
     required this.thurAmount,
     required this.friAmount,
     required this.satAmount,}) : super();

  @override
  Widget build(BuildContext context) {
    Bardata bardata = Bardata(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount
    );
    bardata.initializeBarData();
    return  BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTiles,
              )
            )

          ),
          maxY: 20000,
          minY: 0,
          barGroups: bardata.barData.map((data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(toY: data.y,
                color: Colors.red,
                width: 23,
                borderRadius: BorderRadius.circular(1)
              )
            ]
          )).toList()
        )
    );
  }
}
Widget getBottomTiles(double value, TitleMeta meta ){
  const style = TextStyle(
    color: Colors.black
  );

  Widget text;
  switch(value.toInt()){
    case 1:
      text = Text("SUN", style: style,);
      break;
    case 2:
      text = Text("MON", style: style,);
      break;
    case 3:
      text = Text("TUE", style: style,);
      break;
    case 4:
      text = Text("WED", style: style,);
      break;
    case 5:
      text = Text("THUR", style: style,);
      break;
    case 6:
      text = Text("FRI", style: style,);
      break;
    case 7:
      text = Text("SAT", style: style,);
      break;
    default:
      text = Text("", style: style,);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}


