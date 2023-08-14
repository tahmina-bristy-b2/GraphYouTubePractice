import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeScreen extends StatefulWidget {
  const YouTubeScreen({super.key});

  @override
  State<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const url = "https://www.youtube.com/watch?v=zj4Zf99TMR4";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    print("++++++++++++++++++++++++++++${controller.metadata.author}");
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: controller),
        builder: (context, player) => Scaffold(
              appBar: AppBar(
                title: const Text("Youtube Player"),
              ),
              body: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      player,
                      Text(
                        controller.metadata.title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        controller.metadata.author,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      // Text("${controller.metadata.duration}"),
                      // const SizedBox(
                      //   height: 6,
                      // ),
                      // Text("${controller.metadata.duration.inSeconds} seconds"),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       if (controller.value.isPlaying) {
                      //         controller.pause();
                      //       } else {
                      //         controller.play();
                      //       }
                      //     },
                      //     child:
                      //         Text(controller.value.isPlaying ? "Pause" : "Play")),
                      // const SizedBox(
                      //   height: 16,
                      // ),
                      // ElevatedButton(
                      //     onPressed: () {
                      //       //if(controller.value.);
                      //       controller.unMute();
                      //       controller.seekTo(const Duration(seconds: 10));
                      //     },
                      //     child: const Text("Mute"))
                    ],
                  ),
                ],
              ),
            ));
  }
}
