import 'package:flutter/material.dart';
import 'live_app.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Score',
      home: LiveApp(),
    );
  }
}