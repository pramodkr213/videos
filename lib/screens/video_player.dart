import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_Play extends StatefulWidget {
  const Video_Play({Key? key}) : super(key: key);

  @override
  State<Video_Play> createState() => _MyAppState();
}

class _MyAppState extends State<Video_Play> {
  VideoPlayerController? controller;
  bool isPlaying = false;


  void reload() {
    controller?.dispose();
    controller = VideoPlayerController.networkUrl(Uri.parse("https://media.w3.org/2010/05/sintel/trailer.mp4"));

    controller!.initialize().then((value) {
      if (controller!.value.isInitialized) {
        controller!.play();
        setState(() {
          isPlaying = true;

        });

        controller!.addListener(() {
          if (controller!.value.isCompleted) {
            log("ui: player completed, pos=${controller!.value.position}");
          }
        });
      } else {
        log("video file load failed");
      }
    }).catchError((e) {
      log("controller.initialize() error occurs: $e");
    });
    setState(() {});

  }

  @override
  void initState() {
    super.initState();
    reload();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('video_player_win example app'),
        ),
        body:
        Stack(children: [
          VideoPlayer(controller!),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (isPlaying) {
                  controller!.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  controller!.play();
                  setState(() {
                    isPlaying = true;
                  });
                }
              },
              child: Icon(
                isPlaying? Icons.pause : Icons.play_arrow,
              ),
            ),
          ),

        ]),
      ),
    );
  }
}


