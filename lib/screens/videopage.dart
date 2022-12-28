import 'dart:ui';

import 'package:app_for_grand/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../app/AppBalls.dart';
import '../app/AppVideos.dart';

class VideoPage extends StatefulWidget {
  
  String nameOfMan;

  VideoPage({Key? key, required this.nameOfMan}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState(nameOfMan: nameOfMan);
}

class _VideoPageState extends State<VideoPage> {
  String nameOfMan;
  late VideoPlayerController _videoController;
  late ChewieController chewieController;

  _VideoPageState({required this.nameOfMan});

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
                                  builder: (context) => ProfilePage(
                                        data: Data(
                                            colorOfBall: AppBalls().getRandom(),
                                            nameOfMan: nameOfMan),
                                      )));
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
