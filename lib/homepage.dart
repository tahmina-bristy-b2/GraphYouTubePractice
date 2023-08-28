import 'package:flutter/material.dart';
import 'package:graphpractice/bar_data.dart';
import 'package:graphpractice/bubbleChart.dart';
import 'package:graphpractice/multiple_bubble_chart.dart';
import 'package:graphpractice/multiple_video.dart';
import 'package:graphpractice/openHighLowCloseChart.dart';
import 'package:graphpractice/piechart.dart';
import 'package:graphpractice/showDialogboxscreen.dart';
import 'package:graphpractice/stcakedBarChart.dart';
import 'package:graphpractice/youtubeplayer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const OpenshowDialogfirstScreen()));
              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Open Camera'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Are you want to Open your camera?'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Deny'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Access'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Stacked Bar Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PieChartScreen()));
            },
            child: const Text(" Line & Bar Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => YouTubeScreen()));
            },
            child: const Text("Single YouTube Video Player"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MultipleYouTubePlayerScreen()));
            },
            child: const Text("Multiple YouTube Video Player"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BarDataW()));
            },
            child: const Text("Bar Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StackedBarChartSCreen(name: "Line")));
            },
            child: const Text("Stacked Line Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StackedBarChartSCreen(name: "Bar")));
            },
            child: const Text("Stacked Bar Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StackedBarChartSCreen(name: "Area")));
            },
            child: const Text("Stacked Area Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StackedBarChartSCreen(name: "Column")));
            },
            child: const Text("Stacked Column Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BubbleChartScreen()));
            },
            child: const Text("Bubble Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MultipleBubbledataScreen()));
            },
            child: const Text("Category Wise Bubble Chart"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => OpenHighLowCLoseScreen()));
            },
            child: const Text("OpenHighLowClose Chart"),
          ),
        ],
      ),
    );
  }
}
