import 'package:flutter/material.dart';

import 'package:paikee/utils/constants.dart';
import 'package:paikee/widgets/components/rounded_top_card.dart';
import 'login_page_view.dart';
import 'onboardig_view.dart';
import 'register_view.dart';

PageController _controller = PageController();

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  double loginTop = 1000;
  late Size screenSize;

  showPage(String page) {
    setState(() {
      loginTop = page == "register" ? screenSize.height : 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    screenSize = MediaQuery.of(context).size;
    return PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        Onboarding(authenticationController: _controller),
        roundedTopCard(
          color: theme.primaryColorDark,
          child: Stack(
            children: [
              Register(showPage: showPage),
              AnimatedPositioned(
                duration: duration,
                curve: curve,
                top: loginTop,
                height: screenSize.height,
                width: screenSize.width,
                child: LoginPage(showPage: showPage),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
