import 'dart:ui';

import 'package:app_for_grand/screens/home/widgets/cards.dart';
import 'package:app_for_grand/screens/home/widgets/expanded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../app/AppIcons.dart';
import '../family.dart';
import '../videopagesec.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rus.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BallsPage()));
                      },
                      child: const FamilyCard(),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPage2(nameOfMan: 'itog',)));
                      },
                      child: const CongratulationsCard(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    const Expanded2(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 0.0,
                              tileMode: TileMode.repeated),
                          child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOutQuart);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      color: Colors.black.withOpacity(0),
                                    ),
                                    child: const Align(
                                      alignment: Alignment(-0.2, 0.0),
                                      child: Text(
                                        '7',
                                        style: TextStyle(
                                            fontSize: 48, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ))),
                    ),
                    const Expanded1(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 0.0,
                              tileMode: TileMode.repeated),
                          child: InkWell(
                              onTap: () {
                                _pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOutQuart);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      color: Colors.black.withOpacity(0),
                                    ),
                                    child: Align(
                                      alignment: const Alignment(-0.2, 0.0),
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          AppIcon.birthday,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    ),
                    const Expanded2(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
