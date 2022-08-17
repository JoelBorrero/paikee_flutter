import 'package:flutter/material.dart';

Widget socialLoginButtons({required ThemeData theme, bool dark = false}) =>
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10),
          child: Text("Continuar con",
              style: theme.textTheme.titleMedium?.copyWith(
                  color: dark
                      ? theme.primaryColorDark
                      : theme.scaffoldBackgroundColor),
              textAlign: TextAlign.center),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialButton(() {}, Icons.g_mobiledata),
            socialButton(() {}, Icons.face),
            socialButton(() {}, Icons.apple),
          ],
        ),
      ],
    );

Widget socialButton(onPressed, icon) => Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFFF4F7FC),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, size: 23)),
    );
