import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/binding/init_bindings.dart';
import 'package:flutter_clone_instagram/src/pages/main_tab.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black)
        )
      ),
      home: const MainTab(),
      initialBinding: InitBinding(),
    );
  }
}
