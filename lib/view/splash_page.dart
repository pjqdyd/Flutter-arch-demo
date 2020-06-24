import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/router/Routers.dart';

// 启动页
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() { 
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.of(context).pushNamed(Routers.main_page, arguments: {}); //跳转到首页
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            "启动页",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
