import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paikee/backend/auth.dart';
import 'package:paikee/backend/models/user.dart';
import 'package:paikee/utils/constants.dart';
import 'package:paikee/widgets/components/custom_text_field.dart';
import 'package:paikee/widgets/components/social_login_buttons.dart';
import 'package:paikee/widgets/components/text_with_button.dart';

TextEditingController nameController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController();
bool obscurePassword = true;

class Login extends StatefulWidget {
  final Function showPageVertical;
  final PageController horizontalController;
  const Login(
      {Key? key,
      required this.showPageVertical,
      required this.horizontalController})
      : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                "Nos alegra verte!",
                style: theme.textTheme.titleLarge,
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
              customTextField(
                  controller: passwordController,
                  theme: theme,
                  label: "Contraseña",
                  dark: true,
                  obscureText: obscurePassword,
                  icon: IconButton(
                      onPressed: () => setState(() {
                            obscurePassword = !obscurePassword;
                          }),
                      icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: theme.primaryColorDark))),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      widget.horizontalController
                          .nextPage(duration: duration, curve: curve);
                    },
                    child: Text(
                      "¿Olvidaste tu contraseña?",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    // final prefs = await SharedPreferences.getInstance();
                    User user = await loginDemo(
                        emailController.text, passwordController.text);
                    setState(() {});
                    // await prefs.setString("user", user.toJson(user).toString());
                  },
                  child: const Text("Iniciar sesión")),
              socialLoginButtons(theme: theme, dark: true),
            ],
          ),
          textWithButton(
              text: "¿No tienes una cuenta?",
              buttonText: "Registrarme",
              onPressed: () {
                widget.showPageVertical("register");
              },
              theme: theme)
        ],
      ),
    );
  }
}
