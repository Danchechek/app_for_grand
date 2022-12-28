import 'dart:ui';

import 'package:app_for_grand/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../app/AppBalls.dart';
import '../app/AppVideos.dart';
import 'home/home_screen.dart';

class VideoPage2 extends StatefulWidget {
  String nameOfMan;

  VideoPage2({Key? key, required this.nameOfMan}) : super(key: key);

  @override
  _VideoPage2State createState() => _VideoPage2State(nameOfMan: nameOfMan);
}

class _VideoPage2State extends State<VideoPage2> {
  String nameOfMan;
  late VideoPlayerController _videoController;
  late ChewieController chewieController;

  _VideoPage2State({required this.nameOfMan});

  @override
  void initState() {
    _videoController =
        VideoPlayerController.asset(AppVideos.VideoOfMan[nameOfMan] as String)
          ..initialize().then((_) {
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _videoController,
      allowFullScreen: false,
      allowMuting: false,
      materialProgressColors:
          ChewieProgressColors(backgroundColor: Colors.black),
      autoPlay: true,
    );
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(34),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2.0, sigmaY: 10.0, tileMode: TileMode.repeated),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()));
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(100)),
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                color: Colors.black.withOpacity(0),
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.reply,
                                color: Colors.white,
                                size: 40,
                              )),
                            ),
                          ],
                        ))),
              ),
            ),
            Center(
              child: Container(
                color: Colors.black,
                child: _videoController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoController.value.aspectRatio,
                        child: Chewie(
                          controller: chewieController,
                        ),
                      )
                    : Container(),
              ),
            ),
          ],
        ));
  }
}
