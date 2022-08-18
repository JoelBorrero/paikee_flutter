import 'package:flutter/material.dart';

import 'package:paikee/widgets/components/elevated_card.dart';
import 'package:paikee/widgets/components/text_components.dart';
import 'package:paikee/widgets/modules/date_scheduled_classes.dart';

const String englishLevel = "Intermedio bajo (A2)";
const List data = [
  {
    "date": "Hoy",
    "values": [
      {
        "id": 1,
        "color": 0xFF4CAF50,
        "hour": "10:00 - 13:30",
        "index": "2/6",
        "status": "PRÓXIMA",
        "teacher": {"name": "Camilo Sinera", "picture": "https"}
      },
      {
        "id": 1,
        "color": 0xFFF44336,
        "hour": "11:00 - 14:30",
        "index": "1/4",
        "status": "PRÓXIMA",
        "teacher": {"name": "Sol Micenetti", "picture": "https"}
      },
    ]
  },
  {
    "date": "Sábado 9/10",
    "values": [
      {
        "id": 1,
        "color": 0xFF2196F3,
        "hour": "15:00 - 16:00",
        "index": "3/4",
        "status": "PRÓXIMA",
        "teacher": {"name": "Michael Costas", "picture": "https"}
      },
      {
        "id": 1,
        "color": 0xFF2196F3,
        "hour": "09:30 - 11:00",
        "index": "2/5",
        "status": "PRÓXIMA",
        "teacher": {"name": "Camila Lozada", "picture": "https"}
      },
      {
        "id": 1,
        "color": 0xFF9C27B0,
        "hour": "16:30 - 18:00",
        "index": "2/3",
        "status": "PRÓXIMA",
        "teacher": {"name": "Taya Smith", "picture": "https"}
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
        "index": "3/3",
        "status": "PRÓXIMA",
        "teacher": {"name": "Taya Smith", "picture": "https"}
      },
    ]
  },
];

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        textH1("Salas"),
        const SizedBox(height: 5),
        textMedium("Conocé compañeros nuevos"),
        ElevatedCard(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Tu nivel de inglés actual: ",
                    style: theme.textTheme.bodyMedium),
                TextSpan(
                  text: englishLevel,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => DateScheduledClasses(
                date: data[index]["date"], data: data[index]["values"]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Reservar Clase"),
          ),
        ),
      ],
    );
  }
}
