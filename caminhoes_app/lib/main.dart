import 'package:caminhoes_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caminhoneiros',
      theme: ThemeData(
          primaryColor: Colors.orange[600],
          accentColor: Colors.blueGrey[400],
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16)
          ),
          fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


