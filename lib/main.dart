import 'package:flutter/material.dart';
// import 'package:minishop/home_pg.dart';
// import 'package:minishop/profile.dart';
import 'package:minishop/login_pg.dart';
// import 'package:minishop/signup_pg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: LoginPg(),
    );
  }
}
