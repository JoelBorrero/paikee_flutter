import 'package:flutter/material.dart';
import 'package:paikee/utils/constants.dart';

import '../utils/widgets.dart';

TextEditingController passwordController = TextEditingController(),
    confirmPasswordController = TextEditingController();
bool obscurePassword = true, obscureConfirmPassword = true;
String matchText = "";

class NewPassword extends StatefulWidget {
  final PageController horizontalController;
  const NewPassword({Key? key, required this.horizontalController})
      : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                    "Nueva contraseña",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio",
                  textAlign: TextAlign.center,
                ),
              ),
              customTextField(
                  controller: passwordController,
                  theme: theme,
                  label: "Contraseña",
                  dark: true,
                  obscureText: obscurePassword,
                  onChanged: (value) {
                    String match = getPasswordMatching();
                    setState(() {
                      matchText = match;
                    });
                  },
                  icon: IconButton(
                      onPressed: () => setState(() {
                            obscurePassword = !obscurePassword;
                          }),
                      icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: theme.primaryColorDark))),
              customTextField(
                controller: confirmPasswordController,
                theme: theme,
                label: "Confirmar contraseña",
                dark: true,
                obscureText: obscureConfirmPassword,
                onChanged: (value) {
                  String match = getPasswordMatching();
                  setState(() {
                    matchText = match;
                  });
                },
                icon: IconButton(
                  onPressed: () => setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  }),
                  icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: theme.primaryColorDark),
                ),
              ),
              Text(matchText,
                  style: TextStyle(
                      color: passwordController.text ==
                              confirmPasswordController.text
                          ? Colors.green[600]
                          : Colors.red[800])),
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

String getPasswordMatching() {
  if (passwordController.text.length >= 8 &&
      confirmPasswordController.text.length >= 8) {
    return passwordController.text == confirmPasswordController.text
        ? "Las contraseñas coinciden"
        : "Las contraseñas no coinciden";
  } else {
    return "";
  }
}
