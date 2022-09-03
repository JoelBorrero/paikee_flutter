import 'package:flutter/material.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/widgets/components/text_components.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(
                  foregroundImage: Image.network(widget.user.avatar).image,
                ),
                textH3('  Hola, ${widget.user.name.split(" ")[0]}')
              ]),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.date_range),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Find the best\nteacher for you!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: TextField(
              style: theme.textTheme.bodyLarge
              // ?.copyWith(color: theme.primaryColorDark),
              ,
              expands: true,
              minLines: null,
              maxLines: null,
              // cursorColor: theme.scaffoldBackgroundColor,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.primaryColorDark,
                ),
                hintText: "Buscar profesor",
                filled: true,
                fillColor: theme.cardColor,
                contentPadding: const EdgeInsets.only(left: 10),
                border: InputBorder.none,
                suffixIcon: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: theme.primaryColorDark,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right,
                      color: theme.scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          const SizedBox(height: 10),
          textH3("¿Qué quieres aprender?  temas")
        ],
      ),
    );
  }
}
