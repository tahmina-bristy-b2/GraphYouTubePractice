import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OpenHighLowCLoseScreen extends StatefulWidget {
  const OpenHighLowCLoseScreen({super.key});

  @override
  State<OpenHighLowCLoseScreen> createState() => _OpenHighLowCLoseScreenState();
}

class _OpenHighLowCLoseScreenState extends State<OpenHighLowCLoseScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2012, 04, 02),
          open: 85.9757,
          high: 90.6657,
          low: 85.7685,
          close: 90.5257,
          volume: 660187068),
      ChartSampleData(
          x: DateTime(2012, 04, 09),
          open: 89.4471,
          high: 92,
          low: 86.2157,
          close: 86.4614,
          volume: 912634864),
      ChartSampleData(
          x: DateTime(2012, 04, 16),
          open: 87.1514,
          high: 88.6071,
          low: 81.4885,
          close: 81.8543,
          volume: 1221746066),
      ChartSampleData(
          x: DateTime(2012, 04, 23),
          open: 81.5157,
          high: 88.2857,
          low: 79.2857,
          close: 86.1428,
          volume: 965935749),
      ChartSampleData(
          x: DateTime(2012, 04, 30),
          open: 85.4,
          high: 85.4857,
          low: 80.7385,
          close: 80.75,
          volume: 615249365),
      ChartSampleData(
          x: DateTime(2012, 05, 07),
          open: 80.2143,
          high: 82.2685,
          low: 79.8185,
          close: 80.9585,
          volume: 541742692),
      ChartSampleData(
          x: DateTime(2012, 05, 14),
          open: 80.3671,
          high: 81.0728,
          low: 74.5971,
          close: 75.7685,
          volume: 708126233),
      ChartSampleData(
          x: DateTime(2012, 05, 21),
          open: 76.3571,
          high: 82.3571,
          low: 76.2928,
          close: 80.3271,
          volume: 682076215),
      ChartSampleData(
          x: DateTime(2012, 05, 28),
          open: 81.5571,
          high: 83.0714,
          low: 80.0743,
          close: 80.1414,
          volume: 480059584),
      ChartSampleData(
          x: DateTime(2012, 06, 04),
          open: 80.2143,
          high: 82.9405,
          low: 78.3571,
          close: 82.9028,
          volume: 517577005)
    ];
    return Scaffold(
        body: Center(
            child: SizedBox(
                height: 400,
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      // Renders hiloOpenCloseSeries
                      HiloOpenCloseSeries<ChartSampleData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartSampleData data, _) => data.x,
                        lowValueMapper: (ChartSampleData data, _) => data.low,
                        highValueMapper: (ChartSampleData data, _) => data.high,
                        openValueMapper: (ChartSampleData data, _) => data.open,
                        closeValueMapper: (ChartSampleData data, _) =>
                            data.close,
                      )
                    ]))));
  }
}

class ChartSampleData {
  ChartSampleData(
      {this.x, this.open, this.high, this.low, this.close, this.volume});
  final DateTime? x;
  final num? open;
  final num? high;
  final num? low;
  final num? close;
  final num? volume;
}
