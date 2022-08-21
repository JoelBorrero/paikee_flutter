import 'package:flutter/material.dart';

class ElevatedCard extends StatefulWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool dark;
  final bool paintBorder;
  final VoidCallback? onTap;
  final Widget child;
  const ElevatedCard(
      {Key? key,
      this.padding = const EdgeInsets.all(10),
      this.margin = EdgeInsets.zero,
      this.dark = false,
      this.paintBorder = false,
      this.onTap,
      required this.child})
      : super(key: key);

  @override
  State<ElevatedCard> createState() => _ElevatedCardState();
}

class _ElevatedCardState extends State<ElevatedCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Widget child = Card(
      color: widget.dark ? theme.primaryColorDark : theme.cardColor,
      shadowColor: Colors.grey.shade100,
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: widget.paintBorder
            ? BorderSide(color: theme.primaryColorDark)
            : BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: widget.onTap == null ? widget.margin : EdgeInsets.zero,
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );
    return widget.onTap != null
        ? Container(
            margin: widget.margin,
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(0),
                ),
              ),
              onPressed: widget.onTap,
              child: child,
            ),
          )
        : child;
  }
}
