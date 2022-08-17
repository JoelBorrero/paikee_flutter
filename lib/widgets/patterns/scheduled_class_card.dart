import 'package:flutter/material.dart';
import 'package:paikee/widgets/components/text_components.dart';

class ScheduledClassCard extends StatefulWidget {
  final String status, hour, teacher, index;
  final Color color;
  const ScheduledClassCard(
      {Key? key,
      required this.status,
      required this.hour,
      required this.teacher,
      required this.index,
      required this.color})
      : super(key: key);

  @override
  State<ScheduledClassCard> createState() => _ScheduledClassCardState();
}

class _ScheduledClassCardState extends State<ScheduledClassCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 6, 30, 6),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(3),
                topRight: Radius.circular(8)),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    textH4(widget.status),
                    textH3(widget.hour),
                    textH4(widget.teacher)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10),
                  child: Text(widget.index),
                )
              ],
            ),
            const CircleAvatar(
              child: Text("JB"),
            )
          ],
        ),
      ),
    );
  }
}
