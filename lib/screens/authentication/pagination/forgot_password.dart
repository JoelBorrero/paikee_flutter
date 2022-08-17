import 'package:flutter/material.dart';

import 'package:paikee/utils/constants.dart';
import 'package:paikee/widgets/components/custom_text_field.dart';
import 'package:paikee/widgets/components/text_with_button.dart';

TextEditingController emailController = TextEditingController();

class ForgotPassword extends StatefulWidget {
  final PageController horizontalController;
  const ForgotPassword({Key? key, required this.horizontalController})
      : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              Row(
                children: [
                  IconButton(
                      onPressed: () => widget.horizontalController
                          .previousPage(duration: duration, curve: curve),
                      icon: const Icon(Icons.keyboard_arrow_left)),
                  Text(
                    "Olvidé mi contraseña",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio",
                  textAlign: TextAlign.center,
                ),
              ),
              customTextField(
                  controller: emailController,
                  theme: theme,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  dark: true),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => widget.horizontalController
                      .nextPage(duration: duration, curve: curve),
                  child: const Text("Enviar")),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Volver a enviar código",
                    style: theme.textTheme.bodyLarge,
                  ))
            ],
          ),
          textWithButton(
              text: "¿Tienes un problema?",
              buttonText: "Contáctanos",
              onPressed: () {},
              theme: theme)
        ],
      ),
    );
  }
}
