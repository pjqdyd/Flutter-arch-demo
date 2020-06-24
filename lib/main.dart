import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/router/Routers.dart';
import 'package:flutter_arch_demo/view/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: "",
      onGenerateRoute: (setting){
        return Routers.findRoutes(setting);
      },
      home: SplashPage(),
    );
  }
}