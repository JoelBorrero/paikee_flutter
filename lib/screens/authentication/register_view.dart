import 'package:flutter/material.dart';

import 'package:paikee/widgets/components/custom_text_field.dart';
import 'package:paikee/widgets/components/social_login_buttons.dart';
import 'package:paikee/widgets/components/text_with_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController nameController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController();
bool obscurePassword = true;

class Register extends StatefulWidget {
  final Function showPage;
  const Register({Key? key, required this.showPage}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Bienvenido a Paikee!",
                  style:
                      theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Sagittis nam velit volutpat eu nunc.",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              customTextField(
                  controller: nameController, label: "Nombre", theme: theme),
              customTextField(
                  controller: emailController,
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  theme: theme),
              customTextField(
                  controller: passwordController,
                  label: "Contrase??a",
                  theme: theme,
                  obscureText: obscurePassword,
                  icon: IconButton(
                      onPressed: () => setState(() {
                            obscurePassword = !obscurePassword;
                          }),
                      icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: theme.scaffoldBackgroundColor))),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    print(prefs.getString("user"));
                  },
                  style: theme.elevatedButtonTheme.style,
                  child: const Text(
                    "Registrarme",
                  )),
              socialLoginButtons(theme: theme)
            ],
          ),
          textWithButton(
            text: "??Ya tienes una cuenta?",
            buttonText: "Iniciar sesi??n",
            onPressed: () {
              widget.showPage("login");
            },
            theme: theme,
            dark: false,
          )
        ],
      ),
    );
  }
}
