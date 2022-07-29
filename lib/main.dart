import 'package:flutter/material.dart';
import 'package:paikee/authentication/authentication.dart';
import 'package:paikee/styles/themes.dart';

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
        theme: defaultTheme,
        home: const Authentication());
  }
}
