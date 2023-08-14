import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graphpractice/database/monthlyData.dart';

class BarChartScreen extends StatelessWidget {
  List monthly;
  BarChartScreen({super.key, required this.monthly});

  @override
  Widget build(BuildContext context) {
    Monthly barData = Monthly(
        one: monthly[0],
        two: monthly[1],
        three: monthly[2],
        four: monthly[3],
        five: monthly[4],
        six: monthly[5],
        seven: monthly[6]);
    barData.initialize();

    return BarChart(
      BarChartData(
          minY: 0,
          maxY: 18,
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          barGroups: barData.monthly
              .map(
                (data) => BarChartGroupData(
                  x: data.xAxis.round(),
                  barRods: [
                    BarChartRodData(
                      toY: data.yAxis,
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(.4),
                      backDrawRodData: BackgroundBarChartRodData(
                          toY: 17,
                          show: true,
                          color: const Color.fromARGB(255, 230, 226, 226)),
                      width: 10,
                    ),
                  ],
                ),
              )
              .toList()

          // barGroups: [

          //   BarChartGroupData(
          //     barRods: ,
          //     ),
          //     ],
          ),
    );
  }
}
