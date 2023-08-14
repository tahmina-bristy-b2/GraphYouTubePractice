import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultipleBubbledataScreen extends StatefulWidget {
  const MultipleBubbledataScreen({super.key});

  @override
  State<MultipleBubbledataScreen> createState() =>
      _MultipleBubbledataScreenState();
}

class _MultipleBubbledataScreenState extends State<MultipleBubbledataScreen> {
  List<BubbleChartData> chartDataList = [
    BubbleChartData(
      xAxisCategory: DateTime(2010),
      father: 2,
      mother: 14,
      daughter: 17,
      brother: 6,

      bubblesSize: 60,
      // colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxisCategory: DateTime(2012),
      father: 15,
      mother: 19,
      daughter: 32,
      brother: 6,
      bubblesSize: 70,
      //colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxisCategory: DateTime(2011),
      father: 25,
      mother: 1,
      daughter: 14,
      brother: 26,
      bubblesSize: 35,
      // colorName: Color(0xffF67280),
    ),
    BubbleChartData(
      xAxisCategory: DateTime(2012),
      father: 10,
      mother: 25,
      daughter: 1,
      brother: 5,

      bubblesSize: 3,
      // colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxisCategory: DateTime(2013),
      father: 25,
      mother: 5,
      daughter: 24,
      brother: 2,
      bubblesSize: 40,
      //colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxisCategory: DateTime(2014),
      father: 25,
      mother: 37,
      daughter: 23,
      brother: 14,
      bubblesSize: 2,
      // colorName: Color(0xffF67280),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            width: 370,
            child: SfCartesianChart(
              title: ChartTitle(
                  text: "Category Wise Bubble Chart",
                  textStyle: const TextStyle(
                      color: Color(0xffC06C84),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              primaryXAxis: DateTimeAxis(),
              legend: Legend(
                isVisible: true,
                isResponsive: true,
              ),
              tooltipBehavior: TooltipBehavior(
                  enable: true, elevation: 5, canShowMarker: true),
              series: <ChartSeries>[
                BubbleSeries<BubbleChartData, DateTime>(
                  name: "Father",
                  dataSource: chartDataList,
                  xValueMapper: (BubbleChartData data, _) => data.xAxisCategory,
                  yValueMapper: (BubbleChartData data, _) => data.father,
                  sizeValueMapper: (BubbleChartData data, _) =>
                      data.bubblesSize,
                  // pointColorMapper: (BubbleChartData data, _) => //for use the bubbles color change
                  //     const Color(0xff4B87B9),
                  // color: Color(0xff4B87B9),

                  enableTooltip: true,

                  //gradient: getGradientColorMapper(chartDataList), // it will be used when one color used for gradient,not possible in use multiple or list of data
                ),
                BubbleSeries<BubbleChartData, DateTime>(
                  name: "Mother",
                  dataSource: chartDataList,
                  xValueMapper: (BubbleChartData data, _) => data.xAxisCategory,
                  yValueMapper: (BubbleChartData data, _) => data.mother,
                  sizeValueMapper: (BubbleChartData data, _) =>
                      data.bubblesSize,
                  //pointColorMapper: (BubbleChartData data, _) => data.colorName,
                  enableTooltip: true,

                  // pointColorMapper: (BubbleChartData data, _) =>
                  //     const Color(0xff4B87B9),

                  //gradient: getGradientColorMapper(chartDataList), // it will be used when one color used for gradient,not possible in use multiple or list of data
                ),
                BubbleSeries<BubbleChartData, DateTime>(
                  name: "Daughter",
                  dataSource: chartDataList,
                  xValueMapper: (BubbleChartData data, _) => data.xAxisCategory,
                  yValueMapper: (BubbleChartData data, _) => data.daughter,
                  sizeValueMapper: (BubbleChartData data, _) =>
                      data.bubblesSize,
                  // pointColorMapper: (BubbleChartData data, _) =>
                  //     const Color(0xff4B87B9),
                  // color: Color(0xff4B87B9),

                  enableTooltip: true,

                  //gradient: getGradientColorMapper(chartDataList), // it will be used when one color used for gradient,not possible in use multiple or list of data
                ),
                BubbleSeries<BubbleChartData, DateTime>(
                  name: "Brother",
                  dataSource: chartDataList,
                  xValueMapper: (BubbleChartData data, _) => data.xAxisCategory,
                  yValueMapper: (BubbleChartData data, _) => data.brother,
                  sizeValueMapper: (BubbleChartData data, _) =>
                      data.bubblesSize,
                  // pointColorMapper: (BubbleChartData data, _) =>
                  //     const Color(0xff4B87B9),
                  // color: Color(0xff4B87B9),

                  enableTooltip: true,

                  //gradient: getGradientColorMapper(chartDataList), // it will be used when one color used for gradient,not possible in use multiple or list of data
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BubbleChartData {
  DateTime xAxisCategory;
  double father;
  double mother;
  double daughter;
  double brother;
  double bubblesSize;
  // Color colorName;

  BubbleChartData({
    required this.xAxisCategory,
    required this.father,
    required this.mother,
    required this.daughter,
    required this.brother,
    required this.bubblesSize,
  });
}
