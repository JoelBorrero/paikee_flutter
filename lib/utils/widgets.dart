import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget roundedContainer(
        {required Color color, required Widget child, double marginTop = 50}) =>
    Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: color,
        ),
        margin: EdgeInsets.only(top: marginTop),
        child: child);

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
            enabledBorder: inputBorder(theme: theme, dark: dark),
            focusedBorder: inputBorder(theme: theme, dark: dark),
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

Widget customSquareDigitField({
  required TextEditingController controller,
  required FocusNode focusNode,
  required BuildContext context,
  required ThemeData theme,
  required int index,
}) {
  Color color = theme.primaryColorDark;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: SizedBox(
      width: 45,
      height: 50,
      child: ClipPath(
        clipper: DigitTextFieldClipper(),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            counterText: "",
            enabledBorder: inputBorder(theme: theme, dark: true),
            focusedBorder: inputBorder(theme: theme, dark: true),
          ),
          keyboardType: TextInputType.number,
          style: theme.textTheme.bodyLarge?.copyWith(color: color),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 1,
          onChanged: ((value) {
            if (value.isEmpty && index > 1) {
              FocusScope.of(context).previousFocus();
            } else if (value.isNotEmpty && index < 4) {
              FocusScope.of(context).nextFocus();
            }
          }),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: color,
        ),
      ),
    ),
  );
}

Widget textRowWithButton(
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

Widget socialLogin({required ThemeData theme, bool dark = false}) => Column(
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

InputBorder? inputBorder({required ThemeData theme, bool dark = false}) =>
    theme.inputDecorationTheme.border?.copyWith(
      borderSide: BorderSide(
          style: BorderStyle.solid,
          color: dark ? theme.primaryColorDark : theme.scaffoldBackgroundColor),
    );

class DigitTextFieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * .15);
    path.lineTo(size.width - 1, size.height * .15);
    path.lineTo(size.width - 1, size.height * .85);
    path.lineTo(size.width, size.height * .85);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * .85);
    path.lineTo(1, size.height * .85);
    path.lineTo(1, size.height * .15);
    path.lineTo(0, size.height * .15);
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
