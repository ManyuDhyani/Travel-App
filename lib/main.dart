import 'package:flutter/material.dart';
import 'package:travel_app/pages/detailPage.dart';
import 'package:travel_app/pages/navpages/mainPage.dart';
import 'package:travel_app/pages/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailPage(),
    );
  }
}
