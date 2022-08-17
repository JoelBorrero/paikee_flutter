import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:paikee/utils/themes.dart';

Widget digitTextField({
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
            enabledBorder: inputBorder(dark: true),
            focusedBorder: inputBorder(dark: true),
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
