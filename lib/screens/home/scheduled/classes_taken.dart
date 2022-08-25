import 'package:flutter/material.dart';

import 'package:paikee/widgets/components/rounded_top_card.dart';
import 'package:paikee/widgets/components/text_components.dart';
import 'package:paikee/widgets/modules/date_scheduled_classes.dart';

const List data = [
  {
    "date": "Viernes 8/11",
    "values": [
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "10:00 - 13:30",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Camilo Sinera",
          "avatar": "https://reqres.in/img/faces/1-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "11:00 - 14:30",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Sol Micenetti",
          "avatar": "https://reqres.in/img/faces/3-image.jpg"
        }
      },
    ]
  },
  {
    "date": "Martes 22/10",
    "values": [
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "15:00 - 16:00",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Michael Costas",
          "avatar": "https://reqres.in/img/faces/5-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "09:30 - 11:00",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Camila Lozada",
          "avatar": "https://reqres.in/img/faces/7-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "16:30 - 18:00",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Taya Smith",
          "avatar":
              "https://akamai.sscdn.co/uploadfile/letras/fotos/3/2/8/0/32804b19d67f2ea05cf7098cd514248d.jpg"
        }
      },
    ]
  },
  {
    "date": "Lunes 11/10",
    "values": [
      {
        "id": 1,
        "color": 0xFF091F37,
        "hour": "16:30 - 18:00",
        "index": "",
        "status": "COMPLETADA",
        "teacher": {
          "name": "Taya Smith",
          "avatar":
              "https://akamai.sscdn.co/uploadfile/letras/fotos/3/2/8/0/32804b19d67f2ea05cf7098cd514248d.jpg"
        }
      },
    ]
  },
];

class ClassesTaken extends StatelessWidget {
  final Function onVerticalDragEnd, onVerticalDragUpdate;
  const ClassesTaken(
      {Key? key,
      required this.onVerticalDragEnd,
      required this.onVerticalDragUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return roundedTopCard(
      color: theme.primaryColorDark,
      marginTop: 0,
      child: Column(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) =>
                onVerticalDragUpdate(details.globalPosition.dy),
            onVerticalDragEnd: (details) =>
                onVerticalDragEnd(details.primaryVelocity),
            child: Container(
              width: 200,
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          textH1("Clases tomadas", dark: false),
          const SizedBox(height: 20),
          Flexible(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => DateScheduledClasses(
                  date: data[index]["date"],
                  data: data[index]["values"],
                  dark: true),
            ),
          ),
        ],
      ),
    );
  }
}
