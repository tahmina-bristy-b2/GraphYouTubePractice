import 'package:flutter/material.dart';
import 'package:graphpractice/database/monthlyData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';

class StackedBarChartSCreen extends StatefulWidget {
  String name;
  StackedBarChartSCreen({required this.name});

  @override
  State<StackedBarChartSCreen> createState() => _StackedBarChartSCreenState();
}

class _StackedBarChartSCreenState extends State<StackedBarChartSCreen> {
  late List<MonthlyExpensedata> _dataget = [];

  @override
  void initState() {
    _dataget = getMonthlydata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: Container(),
        body: SfCartesianChart(
          enableAxisAnimation: true,
          title: ChartTitle(
            text: "All Categorys are in Bd(Taka) Amount",
            textStyle: const TextStyle(color: Color.fromARGB(255, 5, 49, 5)),
            alignment: ChartAlignment.center,
          ),
          legend: Legend(
              isVisible: true,
              isResponsive: true,
              shouldAlwaysShowScrollbar: true),
          tooltipBehavior:
              TooltipBehavior(enable: true, elevation: 5, canShowMarker: true),
          series: widget.name != "Bar"
              ? widget.name != "Area"
                  ? widget.name == "Line"
                      ? getStackedLine()
                      : getStackedColumn()
                  : getStackedArea()
              : getStackedBar(),
          primaryXAxis: CategoryAxis(
            //arrangeByIndex: true,
            // isInversed: true,
            title: AxisTitle(
                alignment: ChartAlignment.center,
                text: "Category Wise Expense Data",
                textStyle: const TextStyle(color: Colors.blueAccent)),
          ),
        ),
      ),
    );
  }

  //==============================get Line wise data stack chart==========================================
  List<ChartSeries> getStackedLine() {
    final List<ChartSeries> stackedColumn = [
      StackedLineSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.father,
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
        name: "Father",
      ),
      StackedLineSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.mother,
        name: "Mother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedLineSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.brother,
        name: "Brother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedLineSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.daughter,
        name: "Daughter",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
    ];
    return stackedColumn;
  }

//==============================get column wise data stack chart==========================================
  List<ChartSeries> getStackedColumn() {
    final List<ChartSeries> stackedColumn = [
      StackedColumnSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.father,
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
        name: "Father",
      ),
      StackedColumnSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.mother,
        name: "Mother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedColumnSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.brother,
        name: "Brother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedColumnSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.daughter,
        name: "Daughter",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
    ];
    return stackedColumn;
  }

  //==============================get bar wise data stack chart==========================================
  List<ChartSeries> getStackedBar() {
    final List<ChartSeries> stackedBar = [
      StackedBarSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.father,
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
        name: "Father",
      ),
      StackedBarSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.mother,
        name: "Mother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedBarSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.brother,
        name: "Brother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedBarSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.daughter,
        name: "Daughter",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
    ];
    return stackedBar;
  }

  //==============================get bar wise data stack chart==========================================
  List<ChartSeries> getStackedArea() {
    final List<ChartSeries> stackedBar = [
      StackedAreaSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.father,
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
        name: "Father",
      ),
      StackedAreaSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.mother,
        name: "Mother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedAreaSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.brother,
        name: "Brother",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
      StackedAreaSeries<MonthlyExpensedata, String>(
        dataSource: _dataget,
        xValueMapper: (MonthlyExpensedata data, _) => data.expenseCategory,
        yValueMapper: (MonthlyExpensedata data, _) => data.daughter,
        name: "Daughter",
        markerSettings: const MarkerSettings(
            isVisible: true, height: 6, width: 6, shape: DataMarkerType.circle),
      ),
    ];
    return stackedBar;
  }

  List<MonthlyExpensedata> getMonthlydata() {
    final List<MonthlyExpensedata> monthlyData = [
      MonthlyExpensedata(
          expenseCategory: "January",
          father: 20,
          mother: 10,
          daughter: 25,
          brother: 16),
      MonthlyExpensedata(
          expenseCategory: "February",
          father: 25,
          mother: 20,
          daughter: 23,
          brother: 15),
      MonthlyExpensedata(
          expenseCategory: "March",
          father: 12,
          mother: 34,
          daughter: 26,
          brother: 27),
      MonthlyExpensedata(
          expenseCategory: "April",
          father: 23,
          mother: 31,
          daughter: 29,
          brother: 12),
      MonthlyExpensedata(
          expenseCategory: "May",
          father: 23,
          mother: 19,
          daughter: 29,
          brother: 22),
      MonthlyExpensedata(
          expenseCategory: "June",
          father: 19,
          mother: 29,
          daughter: 19,
          brother: 14),
      MonthlyExpensedata(
          expenseCategory: "July",
          father: 23,
          mother: 21,
          daughter: 21,
          brother: 2),
    ];
    return monthlyData;
  }
}

class MonthlyExpensedata {
  String expenseCategory;
  num father;
  num mother;
  num daughter;
  num brother;

  MonthlyExpensedata({
    required this.expenseCategory,
    required this.father,
    required this.mother,
    required this.daughter,
    required this.brother,
  });
}
