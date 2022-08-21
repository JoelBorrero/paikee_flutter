import 'package:flutter/material.dart';

import 'package:paikee/utils/constants.dart';
import 'package:paikee/widgets/components/rounded_top_card.dart';
import 'package:paikee/widgets/components/text_components.dart';

class ClassesTaken extends StatelessWidget {
  final Function onVerticalDragEnd, onVerticalDragUpdate;
  const ClassesTaken(
      {Key? key,
      required this.onVerticalDragEnd,
      required this.onVerticalDragUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return roundedTopCard(
      color: theme.primaryColorDark,
      marginTop: 0,
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) =>
                onVerticalDragUpdate(details.globalPosition.dy),
            onVerticalDragEnd: (details) =>
                onVerticalDragEnd(details.primaryVelocity),
            child: Container(
              width: 200,
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          textH1("Clases tomadas", dark: false),
        ],
      ),
    );
  }
}
