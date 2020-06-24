
import 'package:flutter/cupertino.dart';
import 'package:flutter_arch_demo/view/main_page.dart';

///路由
class Routers {

  static const String main_page = "/main/mainPage"; //首页

  static Route findRoutes(RouteSettings setting){
    String name = setting.name; //路由名称
    Object arguments = setting.arguments; //路由参数

    return CupertinoPageRoute(builder: (_){
      return _findPage(name, arguments);
    });
  }

  static Widget _findPage(String name, Object arguments) {
    Widget page;
    switch(name){ //匹配路由页面
      case main_page:
        page = MainPage();
        break;
    }
    return page;
  }

}