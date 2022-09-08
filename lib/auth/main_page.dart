import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tremor_admin/auth/auth_page.dart';
import 'package:tremor_admin/pages/login.dart';
import 'package:tremor_admin/pages/welcome.dart';
import 'package:tremor_admin/pages/register.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Welcome();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
