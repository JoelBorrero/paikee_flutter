import 'package:flutter/material.dart';
import 'package:paikee/authentication/register/onboardig_view.dart';
import 'package:paikee/authentication/register/register_view.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: const [Onboarding(), Register()]),
    );
  }
}
