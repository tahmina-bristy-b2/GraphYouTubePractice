import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class WhatsAppScreen extends StatefulWidget {
  const WhatsAppScreen({super.key});

  @override
  State<WhatsAppScreen> createState() => _WhatsAppScreenState();
}

class _WhatsAppScreenState extends State<WhatsAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("WhatsAapp"),
        onPressed: () async {
          final link = WhatsAppUnilink(
            phoneNumber: '+880-1551093321',
            text: "Hey! I'm inquiring about the apartment listing",
          );
          // Convert the WhatsAppUnilink instance to a Uri.
          // The "launch" method is part of "url_launcher".
          await launchUrl(link.asUri());
        },
      ),
    );
  }
}
