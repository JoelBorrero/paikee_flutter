import 'package:flutter/material.dart';
import 'package:paikee/widgets/components/elevated_card.dart';

import 'package:paikee/widgets/components/text_components.dart';
import 'package:paikee/widgets/modules/date_scheduled_classes.dart';

const List data = [
  {
    "date": "Hoy",
    "values": [
      {
        "id": 1,
        "color": 0xFF007EC5,
        "hour": "10:00 - 13:30",
        "index": "",
        "status": "PRÓXIMA",
        "teacher": {
          "name": "Camilo Sinera",
          "avatar": "https://reqres.in/img/faces/1-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFF9C27B0,
        "hour": "11:00 - 14:30",
        "index": "",
        "status": "EN DISPUTA",
        "teacher": {
          "name": "Sol Micenetti",
          "avatar": "https://reqres.in/img/faces/3-image.jpg"
        }
      },
    ]
  },
  {
    "date": "Sábado 9/10",
    "values": [
      {
        "id": 1,
        "color": 0xFF007EC5,
        "hour": "15:00 - 16:00",
        "index": "",
        "status": "PRÓXIMA",
        "teacher": {
          "name": "Michael Costas",
          "avatar": "https://reqres.in/img/faces/5-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFF007EC5,
        "hour": "09:30 - 11:00",
        "index": "",
        "status": "PRÓXIMA",
        "teacher": {
          "name": "Camila Lozada",
          "avatar": "https://reqres.in/img/faces/7-image.jpg"
        }
      },
      {
        "id": 1,
        "color": 0xFFFFD233,
        "hour": "16:30 - 18:00",
        "index": "",
        "status": "EN ESPERA",
        "teacher": {
          "name": "Taya Smith",
          "avatar": "https://reqres.in/img/faces/9-image.jpg"
        }
      },
    ]
  },
  {
    "date": "Lunes 11/10",
    "values": [
      {
        "id": 1,
        "color": 0xFF9C27B0,
        "hour": "16:30 - 18:00",
        "index": "",
        "status": "EN DISPUTA",
        "teacher": {
          "name": "Taya Smith",
          "avatar": "https://reqres.in/img/faces/11-image.jpg"
        }
      },
    ]
  },
];

class ScheduledClasses extends StatefulWidget {
  final Function toggle;
  const ScheduledClasses({Key? key, required this.toggle}) : super(key: key);

  @override
  State<ScheduledClasses> createState() => _ScheduledClassesState();
}

class _ScheduledClassesState extends State<ScheduledClasses> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        textH1("Clases agendadas"),
        const SizedBox(height: 20),
        Flexible(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => DateScheduledClasses(
                date: data[index]["date"], data: data[index]["values"]),
          ),
        ),
        ElevatedCard(
          margin: const EdgeInsets.all(20),
          paintBorder: true,
          onTap: (() {
            widget.toggle(0.0);
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Ver clases tomadas"),
              Icon(
                Icons.refresh,
                color: theme.primaryColorDark,
              )
            ],
          ),
        ),
      ],
    );
  }
}
