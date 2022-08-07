import 'package:flutter/material.dart';
import 'package:paikee/authentication/confirm_identity.dart';
import 'package:paikee/authentication/forgot_password.dart';
import 'package:paikee/authentication/new_password.dart';
import 'package:paikee/authentication/verify_code.dart';
import 'package:paikee/utils/widgets.dart';

import 'login_view.dart';

// PageController _horizontalController = PageController();
PageController _horizontalController = PageController(initialPage: 2);

class LoginPage extends StatefulWidget {
  final Function showPage;
  const LoginPage({Key? key, required this.showPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return roundedContainer(
      color: theme.scaffoldBackgroundColor,
      marginTop: 10,
      child: PageView(
        controller: _horizontalController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Login(
              showPageVertical: widget.showPage,
              horizontalController: _horizontalController),
          ForgotPassword(horizontalController: _horizontalController),
          VerifyCode(horizontalController: _horizontalController),
          NewPassword(horizontalController: _horizontalController),
          ConfirmIdentity(horizontalController: _horizontalController),
        ],
      ),
    );
  }
}
