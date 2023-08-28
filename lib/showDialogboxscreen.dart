import 'package:flutter/material.dart';

class OpenshowDialogfirstScreen extends StatefulWidget {
  const OpenshowDialogfirstScreen({super.key});

  @override
  State<OpenshowDialogfirstScreen> createState() =>
      _OpenshowDialogfirstScreenState();
}

class _OpenshowDialogfirstScreenState extends State<OpenshowDialogfirstScreen> {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => _showAlertDialog());
    //Future.delayed(Duration.zero, () => _showAlertDialog());

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Column 1"),
              Text("Column 1"),
              Text("Column 1"),
              Text("Column 1"),
              Text("Column 1"),
              Text("Column 1"),
              Text("Column 1"),
            ]),
      ),
    );
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
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
  }
}
