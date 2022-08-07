import 'package:flutter/material.dart';
import 'package:paikee/authentication/authentication.dart';
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
      home: wrapper(),
    );
  }
}

Widget wrapper() {
  return const Scaffold(
    body: Authentication(),
    resizeToAvoidBottomInset: false,
  );
}
