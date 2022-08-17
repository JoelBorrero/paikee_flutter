import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final String countryName;
  final String countryFlag;
  final int age;
  final List<String> languajes;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.countryName,
    required this.countryFlag,
    required this.age,
    required this.languajes,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        countryName: json['country_name'],
        countryFlag: json['country_flag'],
        age: json['age'],
        languajes: json['languajes'].cast<String>().toList(),
        avatar: json['avatar'],
      );
    } else {
      return const User(
          id: -1,
          name: "null",
          email: "null",
          role: "null",
          countryName: "null",
          countryFlag: "null",
          age: -1,
          languajes: [],
          avatar: "null");
    }
  }

  String toJson(User user) {
    return jsonEncode({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'role': user.role,
      'country_name': user.countryName,
      'country_flag': user.countryFlag,
      'age': user.age,
      'languajes': user.languajes,
      'avatar': user.avatar,
    });
  }
}
