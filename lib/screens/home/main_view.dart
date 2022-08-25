import 'package:flutter/material.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/screens/home/messages/messages_list.dart';
import 'package:paikee/screens/home/profile.dart';
import 'package:paikee/screens/home/rooms.dart';
import 'package:paikee/screens/home/scheduled/scheduled.dart';
import 'package:paikee/widgets/components/navigation_bar.dart';

PageController _mainController = PageController();
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
          padding: EdgeInsets.only(top: appBarIsDark ? 0 : 20),
          child: PageView(
            controller: _mainController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Rooms(),
              const Messages(),
              const Center(child: Text("HOME")),
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
