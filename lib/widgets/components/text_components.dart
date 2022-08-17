import 'package:flutter/material.dart';
import 'package:paikee/utils/themes.dart';

Text textH1(String text, {bool dark = true}) {
  return Text(text,
      style: lightTheme.textTheme.titleLarge?.copyWith(
          color: dark
              ? lightTheme.primaryColorDark
              : lightTheme.scaffoldBackgroundColor));
}

Text textH2(String text, {bool dark = true}) {
  return Text(text,
      style: lightTheme.textTheme.titleMedium?.copyWith(
          color: dark
              ? lightTheme.primaryColorDark
              : lightTheme.scaffoldBackgroundColor));
}

Text textH3(String text, {bool dark = true}) {
  return Text(text,
      style: lightTheme.textTheme.titleSmall?.copyWith(
          color: dark
              ? lightTheme.primaryColorDark
              : lightTheme.scaffoldBackgroundColor));
}

Text textH4(String text, {Color color = Colors.grey}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
    ),
  );
}

Text textMedium(String text,
    {bool dark = true, FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: lightTheme.textTheme.bodyMedium?.copyWith(
        color: dark
            ? lightTheme.primaryColorDark
            : lightTheme.scaffoldBackgroundColor,
        fontWeight: fontWeight),
  );
}

Text textSmall(String text, {bool dark = true}) {
  return Text(
    text,
    style: lightTheme.textTheme.bodySmall?.copyWith(
        color: dark
            ? lightTheme.primaryColorDark
            : lightTheme.scaffoldBackgroundColor),
    textAlign: TextAlign.center,
  );
}
