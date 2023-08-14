import 'package:flutter/material.dart';
import 'package:graphpractice/barChart.dart';

class BarDataW extends StatefulWidget {
  const BarDataW({super.key});

  @override
  State<BarDataW> createState() => _BarDataWState();
}

class _BarDataWState extends State<BarDataW> {
  List<double> monthlySummery = [10.3, 7, 4, 11, 4, 5, 17, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
              height: 400,
              child: BarChartScreen(
                monthly: monthlySummery,
              ))),
    );
  }
}
