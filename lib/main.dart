import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:paikee/backend/models/user.dart';
import 'package:paikee/screens/authentication/authentication.dart';
import 'package:paikee/screens/home/main_view.dart';
import 'package:paikee/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paikee',
      theme: lightTheme,
      home: const Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  User? _user;

  Future<void> _loadUser() async {
    final SharedPreferences prefs = await _prefs;
    final User user =
        User.fromJson(jsonDecode(prefs.getString("user") ?? "{}"));
    prefs.setString("user", user.toJson(user));
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool authenticated = (_user?.id ?? -1) >= 0;
    return Scaffold(
      body: authenticated ? MainView(user: _user!) : const Authentication(),
      // resizeToAvoidBottomInset: false,
    );
  }
}
