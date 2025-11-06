import 'package:flutter/material.dart';
import 'package:shinobi_statement/src/colors/colors.dart';
import 'package:shinobi_statement/src/screens/screen_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: const ScreenBase(),
        backgroundColor: commonColors.background,
      ),
    );
  }
}
