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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          foregroundImage:
                              Image.network(widget.user.avatar).image,
                        ),
                        textH3('  Hola, ${widget.user.name.split(" ")[0]}')
                      ],
                    ),
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
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.antiAlias,
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
                        margin: const EdgeInsets.all(4),
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
                const SizedBox(height: 16),
                textH3("¿Qué quieres aprender?  temas"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                SimpleRoundedButton(
                  text: "Speaking",
                  selected: true,
                ),
                SimpleRoundedButton(
                  text: "Vocabulary",
                ),
                SimpleRoundedButton(
                  text: "Grammar",
                ),
                SimpleRoundedButton(
                  text: "Others",
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                ProfessorCircleAvatar(imgId: 1),
                ProfessorCircleAvatar(imgId: 2),
                ProfessorCircleAvatar(imgId: 3),
                ProfessorCircleAvatar(imgId: 4),
                ProfessorCircleAvatar(imgId: 5),
                ProfessorCircleAvatar(imgId: 6),
                ProfessorCircleAvatar(imgId: 7),
                ProfessorCircleAvatar(imgId: 8),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: textH3("Profesores recomendados para ti"),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: const [
                    _ProfessorCard(),
                    _ProfessorCard(),
                    _ProfessorCard(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _QuickOption(
            title: "Clase Instantánea",
            subtitle: "¿Quieres tener una clase ahora mismo?",
            isPrimary: true,
            icon: Icons.timer_outlined,
          ),
          const SizedBox(height: 16),
          const _QuickOption(
            title: "Paikee Kids",
            subtitle: "Toma clase con profesores para niños",
            icon: Icons.child_care_outlined,
          ),
          const SizedBox(height: 16),
          const _QuickOption(
            title: "Época de examenes",
            subtitle: "Toma clases de urgencias para tus examenes",
            icon: Icons.quiz_outlined,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _QuickOption extends StatelessWidget {
  const _QuickOption({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isPrimary = false,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isPrimary;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: isPrimary ? const Color(0xff39A7FC) : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH3(title, dark: !isPrimary),
              textSmall(
                subtitle,
                dark: !isPrimary,
              ),
            ],
          ),
          Icon(
            icon,
            size: 40,
            color: isPrimary ? Colors.white : Colors.black,
          )
        ],
      ),
    );
  }
}

class _ProfessorCard extends StatelessWidget {
  const _ProfessorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black87,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Image.network(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            "https://i.pravatar.cc/150?img=32",
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            height: 44,
            color: const Color(0xff2D3548),
            width: 300,
            child: Row(
              children: [
                const Text("ARS \$ 600 /h",
                    style: TextStyle(color: Colors.white)),
                Expanded(child: Container()),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Reservar",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfessorCircleAvatar extends StatelessWidget {
  const ProfessorCircleAvatar({
    Key? key,
    required this.imgId,
  }) : super(key: key);

  final int imgId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.red,
        child: ClipOval(
          child: Image.network(
            "https://i.pravatar.cc/150?img=$imgId",
          ),
        ),
      ),
    );
  }
}

class SimpleRoundedButton extends StatelessWidget {
  const SimpleRoundedButton({
    Key? key,
    required this.text,
    this.selected = false,
  }) : super(key: key);

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: selected ? const Color(0xff2D3548) : const Color(0xffF4F7FC),
          elevation: 0,
          minimumSize: const Size(10, 20),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color:
                  selected ? const Color(0xff2D3548) : const Color(0xffF4F7FC),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xff9FB7D9),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
