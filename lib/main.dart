import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zalik_task/screens/home_screen.dart';

import 'model/home_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => HomeModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
