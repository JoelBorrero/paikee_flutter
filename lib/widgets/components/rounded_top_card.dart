import 'package:flutter/material.dart';

Widget roundedTopCard(
        {required Color color, required Widget child, double marginTop = 50}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: color,
        ),
        margin: EdgeInsets.only(top: marginTop),
        child: child);
