import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MultipleYouTubePlayerScreen extends StatefulWidget {
  @override
  State<MultipleYouTubePlayerScreen> createState() =>
      _MultipleYouTubePlayerScreenState();
}

class _MultipleYouTubePlayerScreenState
    extends State<MultipleYouTubePlayerScreen> {
  final List<String> videoIds = [
    "https://www.youtube.com/watch?v=zj4Zf99TMR4&t=238s",
    " https://www.youtube.com/watch?v=Cu8EiqyM6Rk",
    "https://www.youtube.com/watch?v=zj4Zf99TMR4&t=238s",
    "https://www.youtube.com/watch?v=cUraBWFuwyU",
    "https://www.youtube.com/watch?v=9YDrOom7Z5A",
    "https://www.youtube.com/watch?v=lobTFyQAnaI",
    "https://www.youtube.com/watch?v=w50JEBjVwyE",
    "https://www.youtube.com/watch?v=fP8Zb-b_Tjg",
    "https://www.youtube.com/watch?v=ewpP9Zyl91w",
    "https://www.youtube.com/watch?v=g2YQ6_55eFk",
    "https://www.youtube.com/watch?v=F79NonadP_M",
    "https://www.youtube.com/watch?v=AN1f_hecBaY",
    "https://www.youtube.com/watch?v=K5pO5KJHhZk",
    "https://www.youtube.com/watch?v=H2SSWt7dQPU",
    "https://www.youtube.com/watch?v=e8ZSwb6B3Uo",
    "https://www.youtube.com/watch?v=5v_GvrElHi4",
    "https://www.youtube.com/watch?v=JaeF75DrNRQ",
    "https://www.youtube.com/watch?v=OixM_1vwP3E",
    "https://www.youtube.com/watch?v=vDZrw1_tUWk",
    "https://www.youtube.com/watch?v=zj4Zf99TMR4&t=272s",
    "https://www.youtube.com/watch?v=JjifAO3IYTE",
    "https://www.youtube.com/watch?v=0v6pdhJK0fA",
    "https://www.youtube.com/watch?v=4bwNGDW4GsQ",
    "https://www.youtube.com/watch?v=Oxxzws8P3hs"
  ];
  Map<String, YoutubePlayerController> controllers = {};

  @override
  void initState() {
    for (var i = 0; i < videoIds.length; i++) {
      controllers[videoIds[i]] = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoIds[i])!,
        flags: const YoutubePlayerFlags(
            autoPlay: false, mute: false, loop: false, hideThumbnail: true),
      )..addListener(() {
          if (mounted) {
            setState(() {});
          }
        });
      controllers[videoIds[i]]!.metadata.author;

      // print(
      //     "++++++++++++++++++++++++++++++++++++++${controllers[videoIds[i]]}");
      // print(
      //     "++++++++++++++++++++++++++++++++++++++${controllers[videoIds[i]]!.metadata.author}");
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Image(
          image: AssetImage('assets/images/playstore.png'),
          width: 50,
          height: 80,
        ),
        title: Text(
          'YouTube                                                                       ',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: ListView.builder(
        cacheExtent: 100,
        itemCount: videoIds.length,
        itemBuilder: (context, index) {
          return YouTubePlayerWidget(
            videoId: videoIds[index],
            controller: controllers[videoIds[index]]!,
          );
        },
      ),
    );
  }
}

class YouTubePlayerWidget extends StatelessWidget {
  final String videoId;
  YoutubePlayerController controller;

  YouTubePlayerWidget(
      {Key? key, required this.videoId, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          thumbnail: const Icon(Icons.abc_rounded),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            controller.metadata.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            controller.metadata.author,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Divider(
          thickness: 0.7,
          color: Colors.grey,
        ),
      ],
    );
  }
}
