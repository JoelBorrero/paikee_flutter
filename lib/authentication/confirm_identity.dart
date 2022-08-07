import 'package:flutter/material.dart';
import 'package:paikee/utils/constants.dart';

import '../utils/widgets.dart';

TextEditingController digitController1 = TextEditingController(),
    digitController2 = TextEditingController(),
    digitController3 = TextEditingController(),
    digitController4 = TextEditingController();
FocusNode focusNode1 = FocusNode(),
    focusNode2 = FocusNode(),
    focusNode3 = FocusNode(),
    focusNode4 = FocusNode();

class ConfirmIdentity extends StatefulWidget {
  final PageController horizontalController;
  const ConfirmIdentity({Key? key, required this.horizontalController})
      : super(key: key);

  @override
  State<ConfirmIdentity> createState() => _ConfirmIdentityState();
}

class _ConfirmIdentityState extends State<ConfirmIdentity> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Confirma tu identidad",
                style: theme.textTheme.titleLarge,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium,
                    children: const [
                      TextSpan(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas ",
                      ),
                      TextSpan(
                          text: "pepe@gmail.com",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customSquareDigitField(
                      controller: digitController1,
                      focusNode: focusNode1,
                      context: context,
                      index: 1,
                      theme: theme),
                  customSquareDigitField(
                      controller: digitController2,
                      focusNode: focusNode2,
                      context: context,
                      index: 2,
                      theme: theme),
                  customSquareDigitField(
                      controller: digitController3,
                      focusNode: focusNode3,
                      context: context,
                      index: 3,
                      theme: theme),
                  customSquareDigitField(
                      controller: digitController4,
                      focusNode: focusNode4,
                      context: context,
                      index: 4,
                      theme: theme),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => widget.horizontalController
                      .animateToPage(0, duration: duration, curve: curve),
                  child: const Text("Verificar")),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Abir tu correo",
                    style: theme.textTheme.bodyLarge,
                  ))
            ],
          ),
          textRowWithButton(
              text: "¿Tienes un problema?",
              buttonText: "Contáctanos",
              onPressed: () {},
              theme: theme)
        ],
      ),
    );
  }
}
