import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appinio extends StatefulWidget {
  const Appinio({super.key});

  @override
  State<Appinio> createState() => _AppinioState();
}

class _AppinioState extends State<Appinio> {


  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) {
        setState(() {});
        videoPlayerController.play(); // Start playing automatically

      });
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Video'),
        backgroundColor: Colors.blue[100],
      ),
      child: Center(
          child: CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,

          ),
        ),
    );
  }
}





