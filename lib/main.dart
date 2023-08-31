import 'package:coding_mooner/services/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coding_mooner/mainPage.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
  DB.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '나의 작은 씨니어 개발자',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
