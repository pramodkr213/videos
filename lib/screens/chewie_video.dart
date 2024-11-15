import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScreenPlayer extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<ScreenPlayer> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
        // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
        'https://media.w3.org/2010/05/sintel/trailer.mp4'

    );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 290.0, top: 290.0,),
        // padding: EdgeInsets.only(bottom: 250.0),
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}