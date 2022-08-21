// Auth related API requests
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

const String baseUrl = 'http://192.168.1.18:3002';

/// Login method for User
Future<User> login(String email, String password) async {
  Uri uri = Uri.https(baseUrl, 'login');
  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    try {
      User user = User.fromJson(json.decode(response.body));
      return user;
    } catch (e) {
      return Future<User>.error('Failed to login User');
    }
  } else {
    return Future<User>.error('Failed to login User');
  }
}

Future<User> loginDemo(String email, String password) async {
  final response = await http.get(Uri.parse(
      'https://my-json-server.typicode.com/joelborrero/myjsonserver/users/$email'));
  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(jsonDecode(response.body));
    prefs.setString("user", user.toJson(user));
    return user;
  } else {
    throw Exception('Failed to load User');
  }
}

Future logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user");
  print("logged out succesfully");
}
