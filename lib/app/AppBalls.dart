import 'dart:math';

class AppBalls {
  static const String fioBall = 'assets/images/balls/fioball.png';
  static const String greenBall = 'assets/images/balls/greenball.png';
  static const String orangeBall = 'assets/images/balls/orangeball.png';
  static const String pinkBall = 'assets/images/balls/pinkball.png';
  static const String radBall = 'assets/images/balls/radball.png';
  static const String blueBall = 'assets/images/balls/shar.png';
  static const String skyBall = 'assets/images/balls/skyball.png';
  static const String yellowBall = 'assets/images/balls/yellowball.png';

  static List<String> balls = [
    fioBall,
    greenBall,
    orangeBall,
    pinkBall,
    radBall,
    blueBall,
    skyBall,
    yellowBall
  ];

  String getRandom() {
    final _random = Random();

    return balls[_random.nextInt(balls.length)];
  }
}
