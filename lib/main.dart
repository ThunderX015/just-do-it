import 'package:flutter/material.dart';
import 'package:just_do_it/components/constants.dart';
import 'package:just_do_it/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: darkBgColor,
        body: SplashScreen(),
      ),
    );
  }
}
