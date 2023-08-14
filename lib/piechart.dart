import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {
  // MouseCursor _mouseCursor = MouseCursor.defer;
  bool isTouched = false;
  double indicatorTextSize = 15;
  double IndicatorContainerHeight = 15;
  double IndicatorContainerWidth = 15;
  bool isIndicator = false;

  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: AspectRatio(
                    aspectRatio: 4,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 1,
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        sections: showingSections(indicatorTextSize,
                            IndicatorContainerHeight, IndicatorContainerWidth),
                        pieTouchData: PieTouchData(
                          enabled: true,
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                              print(
                                  "touchIndex==============================$touchedIndex");
                            });
                          },
                        ),
                        centerSpaceRadius: 10,
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 100),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Indicator(
                        textLine: "One",
                        colors: const Color.fromARGB(255, 218, 170, 227),
                        indicatorTextSize:
                            touchedIndex == 0 ? 18 : indicatorTextSize,
                        IndicatorContainerHeight:
                            touchedIndex == 0 ? 18 : IndicatorContainerHeight,
                        IndicatorContainerWidth:
                            touchedIndex == 0 ? 18 : IndicatorContainerWidth,
                        isTouched: isTouched,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Indicator(
                        textLine: "Two",
                        colors: const Color.fromARGB(255, 220, 161, 116),
                        indicatorTextSize:
                            touchedIndex == 1 ? 18 : indicatorTextSize,
                        IndicatorContainerHeight:
                            touchedIndex == 1 ? 18 : IndicatorContainerHeight,
                        IndicatorContainerWidth:
                            touchedIndex == 1 ? 18 : IndicatorContainerWidth,
                        isTouched: isTouched,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Indicator(
                        textLine: "Three",
                        colors: const Color.fromARGB(255, 52, 182, 191),
                        indicatorTextSize:
                            touchedIndex == 2 ? 18 : indicatorTextSize,
                        IndicatorContainerHeight:
                            touchedIndex == 2 ? 18 : IndicatorContainerHeight,
                        IndicatorContainerWidth:
                            touchedIndex == 2 ? 18 : IndicatorContainerWidth,
                        isTouched: isTouched,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Indicator(
                        textLine: "Four",
                        colors: const Color.fromARGB(255, 227, 120, 112),
                        indicatorTextSize:
                            touchedIndex == 3 ? 18 : indicatorTextSize,
                        IndicatorContainerHeight:
                            touchedIndex == 3 ? 18 : IndicatorContainerHeight,
                        IndicatorContainerWidth:
                            touchedIndex == 3 ? 18 : IndicatorContainerWidth,
                        isTouched: isTouched,
                      ),
                    ],
                  ),
                )
                // Expanded(
                //   child: Column(
                //     Indicator()
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                    child: LineChart(LineChartData(
                        lineTouchData: LineTouchData(
                          handleBuiltInTouches: true,
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.teal,
                          ),
                          touchSpotThreshold: 10,
                          enabled: true,
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.solid)),
                        gridData: FlGridData(
                          show: false,
                          // drawVerticalLine: true,
                          // drawHorizontalLine: true,
                          // horizontalInterval: 10,
                        ),

                        //     betweenBarsData: [
                        //   //BetweenBarsData(fromIndex: 0, toIndex: 1)
                        // ],
                        titlesData: FlTitlesData(
                          show: true,
                          // bottomTitles: AxisTitles(
                          //   sideTitles:
                          //       SideTitles(interval: 4, reservedSize: 3),
                          // ),
                          // leftTitles: AxisTitles(
                          //   sideTitles:
                          //       SideTitles(reservedSize: 0, showTitles: true),
                          // ),
                        ),
                        // backgroundColor: Colors.greenAccent,
                        lineBarsData: [
                      LineChartBarData(
                        //par line
                        dashArray: [40],
                        color: Colors.purpleAccent,
                        preventCurveOverShooting: false,
                        barWidth: 4,
                        curveSmoothness: 0.35,

                        spots: [
                          const FlSpot(1, 20),
                          const FlSpot(4, 5),
                          const FlSpot(6, 17),
                          const FlSpot(8, 1),
                        ],
                        isCurved: true,
                        belowBarData: BarAreaData(
                            cutOffY: 0,
                            applyCutOffY: true,
                            show: true,
                            spotsLine: BarAreaSpotsLine(
                                show: true,
                                flLineStyle: FlLine(
                                    color: Colors.black,
                                    strokeWidth: 2))), //line
                      ),
                      LineChartBarData(
                        //par line
                        dashArray: [40],
                        color: const Color.fromARGB(255, 218, 170, 227),
                        preventCurveOverShooting: false,
                        barWidth: 4,
                        curveSmoothness: 0.35,

                        spots: [
                          const FlSpot(2, 10),
                          const FlSpot(3, 2),
                          const FlSpot(6, 13),
                          const FlSpot(8, 17),
                        ],

                        isCurved: true,
                        belowBarData: BarAreaData(
                            cutOffY: 0,
                            applyCutOffY: true,
                            show: true,
                            spotsLine: BarAreaSpotsLine(
                                show: true,
                                flLineStyle: FlLine(
                                    color: Colors.blueGrey,
                                    strokeWidth: 4))), //line
                      )
                    ])))
              ],
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(double indicatorTextSize,
      double IndicatorContainerHeight, double IndicatorContainerWidth) {
    return List.generate(4, (i) {
      isTouched = i == touchedIndex;

      final fontSize = isTouched ? 40.0 : 16.0;
      final radius = isTouched ? 130.0 : 100.0;
      final widgetSize = isTouched ? 65.0 : 40.0;
      indicatorTextSize = isTouched ? 25 : 15;
      IndicatorContainerHeight = isTouched ? 21 : 15;
      IndicatorContainerWidth = isTouched ? 21 : 15;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      print("isTOuched=$isTouched $touchedIndex ");

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 218, 170, 227),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/images/barchat.png',
              size: widgetSize,
              borderColor: const Color.fromARGB(255, 218, 170, 227),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 220, 161, 116),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/images/barchat.png',
              size: widgetSize,
              borderColor: const Color.fromARGB(255, 220, 161, 116),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 52, 182, 191),
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/images/barchat.png',
              size: widgetSize,
              borderColor: const Color.fromARGB(255, 52, 182, 191),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 227, 120, 112),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: _Badge(
              'assets/images/barchat.png',
              size: widgetSize,
              borderColor: const Color.fromARGB(255, 227, 120, 112),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Nahi');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(
          svgAsset,
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  bool isTouched;

  String textLine;
  Color colors;
  double indicatorTextSize;
  double IndicatorContainerHeight;
  double IndicatorContainerWidth;

  Indicator(
      {super.key,
      required this.isTouched,
      required this.textLine,
      required this.colors,
      required this.IndicatorContainerHeight,
      required this.IndicatorContainerWidth,
      required this.indicatorTextSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: IndicatorContainerHeight,
          width: IndicatorContainerWidth,
          decoration: BoxDecoration(
              color: colors, borderRadius: BorderRadius.circular(50)),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(textLine),
      ],
    );
  }
}
