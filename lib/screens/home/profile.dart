import 'package:flutter/material.dart';
import 'package:paikee/backend/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:paikee/backend/auth.dart';
import 'package:paikee/widgets/components/elevated_card.dart';
import 'package:paikee/widgets/components/text_components.dart';
import 'package:paikee/widgets/patterns/profile_top_card.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        ProfileTopCard(user: widget.user),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              ElevatedCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                margin: const EdgeInsets.symmetric(vertical: 20),
                theme: theme,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: textMedium("Billetera",
                              dark: false, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.account_balance_wallet,
                          color: theme.scaffoldBackgroundColor,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        textMedium("Saldo: ", dark: false),
                        textMedium("ARS \$ 3.500",
                            dark: false, fontWeight: FontWeight.bold),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textMedium("Historial de operaciones", dark: false),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Cargar saldo",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              ElevatedCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textMedium("Asistencia"),
                    const Icon(Icons.help_outline)
                  ],
                ),
              ),
              ElevatedCard(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [textMedium("Ajustes"), const Icon(Icons.settings)],
                ),
              ),
              ElevatedCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textMedium("Asistencia"),
                    const Icon(Icons.menu_book)
                  ],
                ),
              ),
              ElevatedCard(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textMedium("Cerrar sesión"),
                    const Icon(Icons.logout)
                  ],
                ),
                onTap: () => logout(),
              ),
            ],
            // ),
          ),
        ),
      ],
    );
  }
}
