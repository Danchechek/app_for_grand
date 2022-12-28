import 'package:flutter/material.dart';
class Expanded1 extends StatelessWidget {
  const Expanded1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
      ),
      flex: 2,
    );
  }
}

class Expanded2 extends StatelessWidget {
  const Expanded2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
      ),
      flex: 1,
    );
  }
}
