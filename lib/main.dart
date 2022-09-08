import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tremor_admin/display.dart';
import 'package:tremor_admin/auth/main_page.dart';
import 'package:tremor_admin/services.dart';
import 'package:tremor_admin/pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        'sales': (context) => Sales(),
        'welcome': (context) => Welcome(),
        'services': (context) => Services(),
        'mainpage': (context) => MainPage(),
      },
    );
  }
}
