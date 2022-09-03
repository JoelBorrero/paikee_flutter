import 'package:flutter/material.dart';

import 'package:paikee/screens/home/scheduled/classes_taken.dart';
import 'package:paikee/screens/home/scheduled/mothly_calendar.dart';
import 'package:paikee/screens/home/scheduled/scheduled_classes.dart';
import 'package:paikee/utils/constants.dart';
import 'package:paikee/widgets/components/rounded_top_card.dart';

double classesTakenTop = 1000;
late Size screenSize;
late EdgeInsets padding;

class Scheduled extends StatefulWidget {
  final Function setAppBarDark;
  const Scheduled({Key? key, required this.setAppBarDark}) : super(key: key);

  @override
  State<Scheduled> createState() => _ScheduledState();
}

class _ScheduledState extends State<Scheduled> {
  void onVerticalDragUpdate(double val) {
    setState(
      () {
        classesTakenTop = val;
      },
    );
  }

  void setAppBarDark(bool dark) {
    widget.setAppBarDark(dark);
    appBarIsDark = dark;
  }

  void swipeClassesTaken(double val) {
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

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    padding = MediaQuery.of(context).padding;
    ThemeData theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: curve,
            height: appBarIsDark ? 350 : 0,
            color: theme.primaryColorDark,
            child: const MothlyCalendar(),
          ),
          AnimatedPositioned(
            duration: duration,
            curve: curve,
            top: appBarIsDark ? 300 : 10,
            height: constraints.maxHeight,
            width: screenSize.width,
            child: roundedTopCard(
              color: theme.scaffoldBackgroundColor,
              marginTop: 0,
              child: ScheduledClasses(
                setAppBarDark: setAppBarDark,
                toggleClassesTaken: swipeClassesTaken,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            curve: curve,
            top: classesTakenTop,
            height: constraints.maxHeight,
            width: screenSize.width,
            child: ClassesTaken(
                onVerticalDragEnd: swipeClassesTaken,
                onVerticalDragUpdate: onVerticalDragUpdate),
          ),
        ],
      );
    });
  }
}
