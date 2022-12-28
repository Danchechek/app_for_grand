import 'dart:async';

import 'package:app_for_grand/app/AppBackgroundImages.dart';
import 'package:app_for_grand/app/AppVideos.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(AppVideos.splashVideo)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      })..addListener(() {if (_controller.value.position == _controller.value.duration) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyHomePage()));
        setState(() {});
      }});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: _controller.value.isInitialized
                ? SizedBox.expand(
                    child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ))
                : SizedBox.expand(
                    child: Image.asset(
                      AppImagesBack.orelSplash,
                      fit: BoxFit.fill,
                    ),
                  )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
