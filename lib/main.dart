import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'features/app/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const App(),
    );
  }
}
