import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graphpractice/database/data.dart';

class MyHomePage extends StatelessWidget {
  final List<Data> dataList;

  MyHomePage(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 1.7,
        child: LineChart(
          LineChartData(
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.red,
                  tooltipBorder: BorderSide.none,
                  fitInsideVertically: true,
                  showOnTopOfTheChartBoxArea: true,
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                    spots: dataList
                        .map((point) => FlSpot(point.xAxis, point.yAxis))
                        .toList(),
                    show: true,
                    color: Colors.blue,
                    isCurved: true,
                    barWidth: 1,
                    shadow: const BoxShadow(color: Colors.black),
                    preventCurveOvershootingThreshold: 10,
                    //isStepLineChart: true,
                    //isStrokeCapRound: true,
                    lineChartStepData: LineChartStepData(
                        stepDirection: LineChartStepData.stepDirectionBackward),
                    dotData: FlDotData(show: true)),
              ]),
          swapAnimationDuration: const Duration(milliseconds: 150),
          swapAnimationCurve: Curves.linear,
        ),
      ),
    );
  }
}
