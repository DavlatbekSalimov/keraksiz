
import 'package:flutter/material.dart';
import 'package:pdpasliddin/core/widgets/wbuttonnav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false
      ),
      home: const WButtomNawBar(),
    );
  }
}