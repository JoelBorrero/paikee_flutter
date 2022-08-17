import 'package:flutter/material.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/screens/home/messages.dart';
import 'package:paikee/screens/home/profile.dart';
import 'package:paikee/screens/home/rooms.dart';
import 'package:paikee/widgets/components/navigation_bar.dart';

PageController _mainController = PageController();

class MainView extends StatefulWidget {
  final User user;
  const MainView({Key? key, required this.user}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: PageView(
            controller: _mainController,
            children: [
              const Rooms(),
              const Messages(),
              const Center(child: Text("HOME")),
              const Center(child: Text("BOOK")),
              Profile(user: widget.user)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(controller: _mainController),
    );
  }
}
