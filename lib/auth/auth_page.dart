import 'package:flutter/material.dart';
import 'package:tremor_admin/pages/login.dart';
import 'package:tremor_admin/pages/register.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreens);
    } else {
      return Register(showLoginPage: toggleScreens);
    }
  }
}
