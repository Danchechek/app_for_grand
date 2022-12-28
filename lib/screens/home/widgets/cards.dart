import 'dart:ui';

import 'package:app_for_grand/app/AppNames.dart';
import 'package:flutter/material.dart';

class FamilyCard extends StatelessWidget {
  const FamilyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCard(AppNames.familyCardName);
  }
}

class CongratulationsCard extends StatelessWidget {
  const CongratulationsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCard(AppNames.CongratulationsCardName);
  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getCard(AppNames.familyCardName);
  }
}

Widget getCard(String tittle) {
  return Padding(padding: const EdgeInsets.all(20), child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 0.0,
            tileMode: TileMode.repeated),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
            const BorderRadius.all(Radius.circular(100)),
            border: Border.all(width: 4, color: Colors.white),
            color: Colors.black.withOpacity(0),
          ),
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  tittle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 400,
                      fontWeight: FontWeight.normal,
                      color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          ),
        ),
      )),);
}
