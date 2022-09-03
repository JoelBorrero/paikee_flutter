import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MothlyCalendar extends StatefulWidget {
  const MothlyCalendar({Key? key}) : super(key: key);

  @override
  State<MothlyCalendar> createState() => _MothlyCalendarState();
}

DateTime _focusedDay = DateTime.now();

class _MothlyCalendarState extends State<MothlyCalendar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle lighterText = TextStyle(color: theme.scaffoldBackgroundColor);
    const TextStyle lightText = TextStyle(color: Color(0xFF8F9BB3));
    return TableCalendar(
      firstDay: DateTime.utc(2022, 08, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (selectedDay, _) {
        _focusedDay = selectedDay;
      },
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextFormatter: (date, locale) =>
            '${DateFormat.MMMM(locale).format(date)}\n${DateFormat.y(locale).format(date)}',
        titleTextStyle: lighterText,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: theme.scaffoldBackgroundColor,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: theme.scaffoldBackgroundColor,
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: lightText, weekendStyle: lightText),
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(color: theme.primaryColorDark),
        todayDecoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        defaultTextStyle: lighterText,
        outsideTextStyle: lightText,
        weekendTextStyle: lighterText,
      ),
    );
  }
}
