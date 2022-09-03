import 'package:flutter/material.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/widgets/components/navigation_bar.dart';

import 'home_view/home.dart';
import 'messages/messages_list.dart';
import 'profile.dart';
import 'rooms.dart';
import 'scheduled/scheduled.dart';

PageController _mainController = PageController(initialPage: 2);
bool appBarIsDark = false;

class MainView extends StatefulWidget {
  final User user;
  final Function setAppBarDark;
  const MainView({Key? key, required this.user, required this.setAppBarDark})
      : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void setAppBarDark(bool dark) {
    widget.setAppBarDark(dark);
    appBarIsDark = dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: !appBarIsDark,
        child: Padding(
          // padding: EdgeInsets.only(top: appBarIsDark ? 0 : 20),
          padding: EdgeInsets.only(top: appBarIsDark ? 0 : 0),
          child: PageView(
            controller: _mainController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Rooms(),
              const Messages(),
              Home(user: widget.user),
              Scheduled(setAppBarDark: setAppBarDark),
              Profile(user: widget.user)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
          controller: _mainController, setAppBarDark: widget.setAppBarDark),
    );
  }
}
