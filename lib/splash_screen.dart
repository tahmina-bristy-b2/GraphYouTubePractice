import 'package:flutter/material.dart';
import 'package:graphpractice/multiple_video.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAnimationBuilder<double>(
          control: Control.mirror,
          tween: Tween(begin: 100.0, end: 200.0),
          duration: const Duration(seconds: 2),
          delay: const Duration(seconds: 1),
          curve: Curves.linear,
          // startPosition: 0.5,
          animationStatusListener: (status) {
            MultipleYouTubePlayerScreen();
            //debugPrint('status updated: $status');
          },
          builder: (context, value, child) {
            // return Container(
            //   width: value,
            //   height: value,
            //   color: Colors.white,
            //   child: child,
            // );
            return const Center(
              child: Image(
                image: AssetImage('assets/images/playstore.png'),
                width: 150,
                height: 280,
              ),
            );
          },
          child: MultipleYouTubePlayerScreen()),
      // body: const Center(
      //   child: Image(
      //     image: AssetImage('assets/images/playstore.png'),
      //     width: 50,
      //     height: 80,
      //   ),
      // ),
    );
  }
}
