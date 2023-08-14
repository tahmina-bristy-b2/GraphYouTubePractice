import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BubbleChartScreen extends StatefulWidget {
  const BubbleChartScreen({super.key});

  @override
  State<BubbleChartScreen> createState() => _BubbleChartScreenState();
}

class _BubbleChartScreenState extends State<BubbleChartScreen> {
  // List<Color> colorList=[
  // //   Color(0xffF8B195),
  // //   Color(0xff4B87B9),
  // //   Color(0xffF67280),
  // //  Color(0xffC06C84)

  // // ];

  //  final List<Color> colors = <Color>[];
  //       colors.add(Color(0xffF8B195),);
  //       color.add(Color(0xff4B87B9));
  //       color.add(Color(0xffF67280),);

  //        List<double> stops = <double>[];
  //       stops.add(0.0);
  //       stops.add(0.5);
  //       stops.add(1.0);

  //       final LinearGradient gradientColors =
  //           LinearGradient(colors: color, stops: stops);

  List<BubbleChartData> chartDataList = [
    BubbleChartData(
      xAxis: DateTime(2010),
      yAxis: 12,
      bubblesSize: 60,
      colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxis: DateTime(2012),
      yAxis: 1,
      bubblesSize: 70,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2011),
      yAxis: 56,
      bubblesSize: 70,
      colorName: Color(0xffF67280),
    ),
    BubbleChartData(
      xAxis: DateTime(2013),
      yAxis: 12,
      bubblesSize: 45,
      colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxis: DateTime(2010),
      yAxis: 23,
      bubblesSize: 40,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2015),
      yAxis: 16,
      bubblesSize: 64,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2016),
      yAxis: 6,
      bubblesSize: 12,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2011),
      yAxis: 12,
      bubblesSize: 60,
      colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxis: DateTime(2012),
      yAxis: 1,
      bubblesSize: 70,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2013),
      yAxis: 54,
      bubblesSize: 7,
      colorName: Color(0xffF67280),
    ),
    BubbleChartData(
      xAxis: DateTime(2014),
      yAxis: 17,
      bubblesSize: 42,
      colorName: Color(0xffF67280),
    ),
    BubbleChartData(
      xAxis: DateTime(2015),
      yAxis: 32,
      bubblesSize: 44,
      colorName: Color(0xff4B87B9),
    ),
    BubbleChartData(
      xAxis: DateTime(2016),
      yAxis: 16,
      bubblesSize: 67,
      colorName: Color(0xffF8B195),
    ),
    BubbleChartData(
      xAxis: DateTime(2017),
      yAxis: 7,
      bubblesSize: 12,
      colorName: Color(0xffC06C84),
    ),
  ];

  // Color getGradientColor(
  //   BubbleChartData data,
  // ) {
  //   final List<Color> gradientColors = data.colorName;

  //   return gradientColors.isNotEmpty ? gradientColors[0] : Colors.transparent;
  //   // Define your logic here to create a LinearGradient based on the data
  //   // For example, you can use the gradientColors property to determine the gradient color
  //   //return LinearGradient(colors: gradientColors);
  // }

  // LinearGradient getGradientColorMapper(List<BubbleChartData> chartDataList) {
  //   final List<Color> colors = [];
  //   // for (final BubbleChartData data in chartDataList) {
  //   //   if (data.colorName == const Color(0xffC06C84)) {
  //   //     colors.add(const Color(0xffC06C84));
  //   //     print("colors=$colors");
  //   //   }
  //   // }

  //   for (final BubbleChartData data in chartDataList) {
  //     colors.add(data.colorName);
  //     // colors.add(data.colorName[0]);
  //     print("colors=$colors");
  //   }

  //   return LinearGradient(
  //     colors: colors,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 450,
            child: SfCartesianChart(
              title: ChartTitle(
                  text: "Bubble Chart",
                  textStyle: TextStyle(
                      color: Color(0xffC06C84),
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              primaryXAxis: DateTimeAxis(),
              //legend: Legend(isVisible: true),
              series: <ChartSeries>[
                BubbleSeries<BubbleChartData, DateTime>(
                  dataSource: chartDataList,
                  xValueMapper: (BubbleChartData data, _) => data.xAxis,
                  yValueMapper: (BubbleChartData data, _) => data.yAxis,
                  sizeValueMapper: (BubbleChartData data, _) =>
                      data.bubblesSize,
                  pointColorMapper: (BubbleChartData data, _) => data.colorName,
                  enableTooltip: true,

                  // markerSettings: const MarkerSettings(
                  //     isVisible: true,
                  //     height: 6,
                  //     width: 6,
                  //     shape: DataMarkerType.circle),

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
  DateTime xAxis;
  double yAxis;
  double bubblesSize;
  Color colorName;

  BubbleChartData({
    required this.xAxis,
    required this.yAxis,
    required this.bubblesSize,
    required this.colorName,
  });
}
