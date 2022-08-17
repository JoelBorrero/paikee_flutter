import 'package:flutter/material.dart';

class ElevatedCard extends StatefulWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget child;
  final ThemeData? theme;
  final VoidCallback? onTap;
  const ElevatedCard(
      {Key? key,
      this.padding = const EdgeInsets.all(10),
      this.margin = EdgeInsets.zero,
      this.theme,
      required this.child,
      this.onTap})
      : super(key: key);

  @override
  State<ElevatedCard> createState() => _ElevatedCardState();
}

class _ElevatedCardState extends State<ElevatedCard> {
  @override
  Widget build(BuildContext context) {
    Widget child = Card(
      color: widget.theme != null
          ? widget.theme?.primaryColorDark
          : const Color(0xFFF4F7FC),
      shadowColor: Colors.grey.shade100,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: widget.margin,
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );
    return widget.onTap != null
        ? GestureDetector(
            onTap: widget.onTap,
            child: child,
          )
        : child;
  }
}
