import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_videos/screens/appinio_video.dart';
import 'package:play_videos/screens/chewie_video.dart';
import 'package:play_videos/screens/flick_video.dart';
import 'package:play_videos/screens/video_player.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Videos',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Video_Play()));
                },
                child: Text(
                    'Video-Play'
                )
            ),
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>VideoPlayerScreen()));
                },
                child: Text(
                    'Flick-Player'
                )
            ),
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>ScreenPlayer()));
                },
                child: Text(
                    'Chewie-Player'
                )
            ),
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.only(left: 18, right: 18),
                  // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Appinio()));
                },
                child: Text(
                    'Appinio-Player'
                )
            ),
          ],
        ),
      ),
    );
  }
}
