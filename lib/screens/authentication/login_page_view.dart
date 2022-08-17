import 'package:flutter/material.dart';

import 'package:paikee/widgets/components/rounded_top_card.dart';
import 'pagination/confirm_identity.dart';
import 'pagination/forgot_password.dart';
import 'pagination/login_view.dart';
import 'pagination/new_password.dart';
import 'pagination/verify_code.dart';

PageController _horizontalController = PageController();

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
    return roundedTopCard(
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
