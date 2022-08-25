import 'package:flutter/material.dart';
import 'package:paikee/widgets/components/text_components.dart';

class ScheduledClassCard extends StatefulWidget {
  final String status, hour, teacher, index, avatar;
  final Color color;
  final bool dark;
  const ScheduledClassCard(
      {Key? key,
      required this.status,
      required this.hour,
      required this.teacher,
      required this.index,
      required this.color,
      required this.avatar,
      this.dark = false})
      : super(key: key);

  @override
  State<ScheduledClassCard> createState() => _ScheduledClassCardState();
}

class _ScheduledClassCardState extends State<ScheduledClassCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Color backgroundColor = widget.dark
            ? theme.primaryColorDark
            : theme.scaffoldBackgroundColor,
        textColor = widget.dark
            ? theme.scaffoldBackgroundColor
            : theme.primaryColorDark;
    return Container(
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          color: widget.dark ? Colors.grey.shade900 : widget.color,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 6, 30, 6),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(3),
                topRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: widget.dark
                      ? const Color(0x1370C4F3)
                      : Colors.grey.shade300)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    textH4(widget.status, color: textColor),
                    textH3(widget.hour, dark: !widget.dark),
                    textH4(widget.teacher, color: textColor)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Text(widget.index),
                )
              ],
            ),
            CircleAvatar(
              foregroundImage: Image.network(widget.avatar).image,
            )
          ],
        ),
      ),
    );
  }
}
