import 'package:caminhoes_app/models/location_model.dart';
import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return ScopedModel<LocationModel>(
            model: LocationModel(model),
            child: MaterialApp(
            title: 'Caminhoneiros',
            theme: ThemeData(
              primaryColor: Colors.orange[600],
              accentColor: Colors.blueGrey[400],
              textTheme: TextTheme(bodyText1: TextStyle(fontSize: 16)),
              fontFamily: 'Roboto',
            ),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          ),
          );
        },
      ),
    );
  }
}
