import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  Future<void> _initVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterfly Video'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                 /* SizedBox(
                    height: 25.0,
                    child:ValueListenableBuilder(
                      valueListenable: _controller,
                      builder: (context, value, child) {
                        return IconButton(
                          icon: Icon(_isPlaying? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 46,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPlaying =!_isPlaying;
                            });
                            _isPlaying? _controller.play() : _controller.pause();
                          },
                        );
                      },
                    ),
                  ),*/
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _controller,
                          builder: (context, value, child) {
                            return IconButton(
                              icon: Icon(_isPlaying? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                                size: 46,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPlaying =!_isPlaying;
                                });
                                _isPlaying? _controller.play() : _controller.pause();
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                          ),
                        ),
                        IconButton(
                          icon: Icon(_isFullScreen? Icons.fullscreen_exit : Icons.fullscreen,
                          size: 36,
                          color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFullScreen =!_isFullScreen;
                            });
                            _isFullScreen
                                ? SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.landscapeRight,
                            ])
                                : SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                            ]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

