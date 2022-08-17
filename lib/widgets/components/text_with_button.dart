import 'package:flutter/material.dart';

Widget textWithButton(
        {required String text,
        required String buttonText,
        required VoidCallback onPressed,
        required ThemeData theme,
        dark = true}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: theme.textTheme.bodyLarge?.copyWith(
                color: dark
                    ? theme.primaryColorDark
                    : theme.scaffoldBackgroundColor)),
        TextButton(
          onPressed: onPressed,
          style: theme.textButtonTheme.style,
          child: Text(
            buttonText,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: dark
                    ? theme.primaryColorDark
                    : theme.scaffoldBackgroundColor),
          ),
        ),
      ],
    );
