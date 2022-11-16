import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'core/di/dependency_container.dart';
import 'core/network/dio_helper.dart';
import 'features/app/app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  DioHelper.init();

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
