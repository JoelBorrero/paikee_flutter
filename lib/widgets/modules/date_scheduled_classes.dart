import 'package:flutter/material.dart';

import 'package:paikee/backend/models/scheduled_class.dart';
import 'package:paikee/widgets/components/text_components.dart';
import 'package:paikee/widgets/patterns/scheduled_class_card.dart';

class DateScheduledClasses extends StatefulWidget {
  final String date;
  final List data;
  final bool dark;
  const DateScheduledClasses(
      {Key? key, required this.date, required this.data, this.dark = false})
      : super(key: key);

  @override
  State<DateScheduledClasses> createState() => _DateScheduledClassesState();
}

class _DateScheduledClassesState extends State<DateScheduledClasses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: childrenListView(widget.data, widget.date, widget.dark),
      ),
    );
  }
}

List<Widget> childrenListView(List data, String title, bool dark) {
  List<Widget> children = [
    textH3(title, dark: !dark),
    const SizedBox(height: 15),
  ];
  for (var obj in data) {
    ScheduledClass scheduledClass = ScheduledClass.fromJson(obj);
    children.add(
      ScheduledClassCard(
          status: scheduledClass.status,
          hour: scheduledClass.hour,
          teacher: scheduledClass.teacher,
          index: scheduledClass.index,
          color: Color(scheduledClass.color),
          avatar: scheduledClass.avatar,
          dark: dark),
    );
  }
  return children;
}
