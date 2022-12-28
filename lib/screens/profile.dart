import 'dart:ui';

import 'package:app_for_grand/app/AppBackgroundImages.dart';
import 'package:app_for_grand/screens/videopage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../app/AppVideos.dart';
import 'family.dart';

class ProfilePage extends StatefulWidget {
  Data data;

  ProfilePage({Key? key, required this.data}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(data: data);
}

class _ProfilePageState extends State<ProfilePage> {
  Data data;
  late VideoPlayerController _videoController;
  bool flag = false;

  _ProfilePageState({required this.data});

  late String tag;

  initState() {
    _videoController = VideoPlayerController.asset(
        AppVideos.VideoOfMan[data.nameOfMan] as String)
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        if (_videoController.value.isInitialized && flag == false) {
          setState(() {
            flag = true;
          });
        }
      });
    tag = data.nameOfMan;
  }

  @override
  void dispose() {
    _videoController.dispose();
    if (tag == data.nameOfMan) {
      setState(() {
        tag = '';
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightOfBall = MediaQuery.of(context).size.height / 3;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pole2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(34),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 2.0, sigmaY: 10.0, tileMode: TileMode.repeated),
                child: InkWell(
                    onTap: () {
                      if (tag != '') {
                        setState(() {
                          tag = '';
                        });
                      }
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 2),
                              pageBuilder: (_, __, ___) => BallsPage()));
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(width: 2, color: Colors.white),
                            color: Colors.black.withOpacity(0),
                          ),
                          child: Center(
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
        Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32),
                child: Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: tag,
                      child: SizedBox(
                          height: heightOfBall,
                          width: heightOfBall * 0.78455,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(0, -0.5),
                                child: Image.asset(
                                  data.colorOfBall,
                                ),
                              ),
                              Align(
                                alignment: Alignment(0, -0.5),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  child: Container(
                                    width: heightOfBall / 2,
                                    height: heightOfBall / 2,
                                    padding: EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      child: Image.asset(
                                        data.nameOfMan,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2 / 3 - 96,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Container(
                            padding: EdgeInsets.all(10  ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImagesBack.korzina),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(55),
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: _videoController.value.isInitialized
                                        ? _videoController.value.size.width
                                        : 100,
                                    height: _videoController.value.isInitialized
                                        ? _videoController.value.size.height
                                        : 100,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            PageRouteBuilder(
                                                transitionDuration:
                                                    Duration(seconds: 2),
                                                pageBuilder: (_, __, ___) =>
                                                    VideoPage(
                                                        nameOfMan:
                                                            data.nameOfMan)));
                                      },
                                      child: VideoPlayer(_videoController),
                                    ),
                                  ),
                                )))))),
          ],
        )
      ],
    ));
  }
}

class Data {
  late String colorOfBall;
  late String nameOfMan;

  Data({required this.colorOfBall, required this.nameOfMan});
}
