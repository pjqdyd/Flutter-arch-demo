import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_arch_demo/provider/provider_widget.dart';
import 'package:flutter_arch_demo/utils/http.dart';
import 'package:flutter_arch_demo/vm/main_vm.dart';
import 'package:flutter_arch_demo/widget/default_appbar.dart';

//首页
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "首页", canBack: false).build(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              ProviderWidget<MainViewModel>(
                model: MainViewModel(),
                onReady: (model){ //组件初始化之后
                  model.loadData(); //通过provider调用model加载数据
                },
                builder: (context, model, child){
                  return Text("首页");
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
