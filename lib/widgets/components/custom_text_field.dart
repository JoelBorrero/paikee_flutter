import 'package:flutter/material.dart';

import 'package:paikee/utils/themes.dart';

Widget customTextField(
    {required TextEditingController controller,
    required String label,
    required ThemeData theme,
    bool dark = false,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Function(String)? onChanged,
    IconButton? icon}) {
  Color color = dark ? theme.primaryColorDark : theme.scaffoldBackgroundColor;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: inputBorder(dark: dark),
            focusedBorder: inputBorder(dark: dark),
            labelText: label,
            labelStyle: TextStyle(color: color),
            helperStyle: TextStyle(color: color),
            suffixIcon: icon),
        keyboardType: keyboardType,
        style: theme.textTheme.bodyLarge?.copyWith(color: color),
        textAlignVertical: TextAlignVertical.top,
        obscureText: obscureText,
        onChanged: (value) => onChanged?.call(value),
        cursorColor:
            dark ? theme.primaryColorDark : theme.scaffoldBackgroundColor,
      ),
    ),
  );
}
