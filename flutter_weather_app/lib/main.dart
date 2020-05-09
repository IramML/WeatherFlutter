import 'package:flutter/material.dart';
import 'package:flutterweatherapp/pages/home.dart';
import 'package:flutterweatherapp/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      routes: {
        "splash":(context)=>SplashPage(),
        "home":(context)=>HomePage(),
      },
    );
  }
}

