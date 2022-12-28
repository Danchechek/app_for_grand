import 'dart:async';
import 'dart:ui';

import 'package:app_for_grand/app/AppBackgroundImages.dart';
import 'package:app_for_grand/app/AppBalls.dart';
import 'package:app_for_grand/app/AppPeople.dart';
import 'package:app_for_grand/screens/home/home_screen.dart';
import 'package:app_for_grand/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BallsPage extends StatefulWidget {
  const BallsPage({Key? key}) : super(key: key);

  @override
  State<BallsPage> createState() => _BallsPageState();
}

class _BallsPageState extends State<BallsPage> with TickerProviderStateMixin {
  late Animation wightAnimation;
  late AnimationController wightController;
  List<String> colorsOfBalls = [];

  late Animation vspomAnimation;
  late AnimationController vspomController;

  List<String> people = AppPeople().getPeople();

  late Image imageOfBack;

  late HeroController heroController;

  @override
  void initState() {
    super.initState();

    imageOfBack = Image.asset(
      AppImagesBack.lovatMostBack,
      fit: BoxFit.cover,
    );

    for (int i = 0; i < people.length; i++) {
      colorsOfBalls.add(AppBalls().getRandom());
    }

    vspomController = AnimationController(
        vsync: this, duration: Duration(seconds: colorsOfBalls.length * 2));

    vspomAnimation = Tween<double>(begin: 0, end: colorsOfBalls.length / 3)
        .animate(vspomController);

    vspomController
      .addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          vspomController.forward(from: 0);
        }
      });

    wightController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));

    wightAnimation = Tween<double>(begin: -1, end: 1.0)
        .animate(CurvedAnimation(parent: wightController, curve: Curves.ease));

    wightController
      .addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          wightController.reverse();
        }

        if (status == AnimationStatus.dismissed) {
          wightController.forward();
        }
      });

    heroController = HeroController();

    wightController.forward();

    vspomController.forward();
  }


  @override
  void didChangeDependencies() {

    precacheImage(imageOfBack.image, context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    wightController.dispose();
    vspomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightOfBall = MediaQuery.of(context).size.height / 3;

    List<Widget> widgets = [];
    for (int i = 0; i < colorsOfBalls.length; i++) {
      widgets.add(AnimatedBuilder(
          animation: Listenable.merge([wightAnimation, vspomAnimation]),
          child: SizedBox(
            height: heightOfBall,
            child: Hero(tag: people[i],
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Data data = Data(colorOfBall: colorsOfBalls[i], nameOfMan: people[i]);
                    Navigator.push(context, PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 2),
                        pageBuilder: (_, __, ___) => ProfilePage(data: data,)));
                  },
                  child: SizedBox(
                      width: heightOfBall * 0.78455,
                      child: Stack(
                        children: [
                          Image.asset(
                            colorsOfBalls[i],
                          ),
                          Align(
                            alignment: const Alignment(0, -0.5),
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                              child: Container(
                                width: heightOfBall / 2,
                                height: heightOfBall / 2,
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                                  child: Image.asset(
                                    people[i],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),)
          ),
          builder: (BuildContext context, Widget? child) {
            return Positioned(
              left: i % 2 == 0
                  ? MediaQuery.of(context).size.width / 2 -
                      heightOfBall * 0.78455 / 2 +
                      wightAnimation.value *
                          MediaQuery.of(context).size.width /
                          3
                  : MediaQuery.of(context).size.width / 2 -
                      heightOfBall * 0.78455 / 2 -
                      wightAnimation.value *
                          MediaQuery.of(context).size.width /
                          3,
              bottom: (MediaQuery.of(context).size.height + heightOfBall) *
                      (vspomAnimation.value) -
                  heightOfBall * (i + 1),
              child: child!,
            );
          }));
    }

    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: imageOfBack,
        ),
        Stack(
          children: [
            Stack(
              children:
                  widgets, // This trailing comma makes auto-formatting nicer for build methods.
            ),
          ],
        ),
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
                            border: Border.all(width: 2, color: Colors.white),
                            color: Colors.black.withOpacity(0),
                          ),
                          child: const Center(
                            child: Icon(Icons.reply, color: Colors.white,
                            size: 40,)
                            ),
                          ),
                      ],
                    ))),
          ),
        )
      ],
    ));
  }
}
