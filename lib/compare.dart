import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class WhichShift extends StatefulWidget {
  const WhichShift({super.key});

  @override
  State<WhichShift> createState() => _WhichShiftState();
}

class _WhichShiftState extends State<WhichShift> with TickerProviderStateMixin {
  List<DateTime> dataList = [
    DateTime.parse("2023-06-21 04:50:00"),
    DateTime.parse("2023-06-21 13:00:00"),
    DateTime.parse("2023-06-21 19:00:00"),
    DateTime.parse("2023-06-21 18:20:00"),
    DateTime.parse("2023-06-21 20:20:00"),
  ];
  DateTime now = DateTime.now();
  DateTime? nearest;
  Timer? _timer;

  Timer? countdownTimer;

  String days = '';
  String hours = '';
  String minutes = '';
  String seconds = '';
  int nearestDateIndex = 0;

  Duration? myDuration;
  @override
  void initState() {
    super.initState();
    nearest = dataList[0];
    for (int i = 0; i < dataList.length; i++) {
      // if (differenceTwoDate(dataList[i], DateTime.now()) >
      //     differenceTwoDate(dataList[nearestDateIndex], DateTime.now())) {
      //   nearestDateIndex = i;
      // }
      // if (dataList[i].isAfter(DateTime.now()) &&
      //     dataList[nearestDateIndex].isBefore(DateTime.now())) {
      //   nearestDateIndex = i;
      // }
      // nearest = dataList[nearestDateIndex];
      // print("nearest date =$nearestDateIndex}");
      if (nearest!.isAfter(dataList[i]) != true) {
        nearest = nearest;
      } else {
        nearest = dataList[i];
      }
    }

    DateTime from = DateTime.now();
    print("current date=$from");
    DateTime to = nearest!;
    print("to date=$to");

    Duration difference = to.difference(from);
    Duration defferenceBetweentoDate = to.difference(from);
    print("nearest =$defferenceBetweentoDate");
    myDuration = Duration(
      hours: defferenceBetweentoDate.inHours.remainder(24),
      minutes: defferenceBetweentoDate.inMinutes.remainder(60),
      seconds: defferenceBetweentoDate.inSeconds.remainder(60),
    );
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration!.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  int differenceTwoDate(DateTime date1, DateTime date2) {
    return date1.difference(date2).inMilliseconds.abs();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    days = strDigits(myDuration!.inDays);
    hours = strDigits(myDuration!.inHours.remainder(24));
    minutes = strDigits(myDuration!.inMinutes.remainder(60));
    seconds = strDigits(myDuration!.inSeconds.remainder(60));
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                stopTimer();
              },
              child: const Text("Timer Off ")),
          const SizedBox(
            height: 20,
          ),
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
        ]),
      ),
    );
  }
}
