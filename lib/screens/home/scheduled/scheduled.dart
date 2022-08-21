import 'package:flutter/material.dart';

import 'package:paikee/screens/home/scheduled/classes_taken.dart';
import 'package:paikee/screens/home/scheduled/scheduled_classes.dart';
import 'package:paikee/utils/constants.dart';

// bool showClassesTaken = false;
double classesTakenTop = 1000;
late Size screenSize;

class Scheduled extends StatefulWidget {
  const Scheduled({Key? key}) : super(key: key);

  @override
  State<Scheduled> createState() => _ScheduledState();
}

class _ScheduledState extends State<Scheduled> {
  swipeClassesTaken(double val) {
    setState(
      () {
        if (val <= 0) {
          classesTakenTop = 0;
        } else {
          classesTakenTop = screenSize.height;
        }
      },
    );
  }

  onVerticalDragUpdate(double val) {
    setState(
      () {
        classesTakenTop = val;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ScheduledClasses(toggle: swipeClassesTaken),
        AnimatedPositioned(
          duration: duration,
          curve: curve,
          top: classesTakenTop,
          height: screenSize.height,
          width: screenSize.width,
          child: ClassesTaken(
              onVerticalDragEnd: swipeClassesTaken,
              onVerticalDragUpdate: onVerticalDragUpdate),
        ),
      ],
    );
  }
}
