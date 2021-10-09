import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:cryptara/helpers/theme.dart';
import 'package:cryptara/helpers/auth.dart';
import 'package:cryptara/screens/auth_screen.dart';
import 'package:cryptara/main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

String name = "Cryptara";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: name,
      theme: lightTheme,
      home: isLoggedIn() ? MainApp() : AuthScreen(),
    );
  }
}
