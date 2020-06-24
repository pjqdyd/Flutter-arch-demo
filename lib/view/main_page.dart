import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_arch_demo/model/MainModel.dart';
import 'package:flutter_arch_demo/provider/ProviderWidget.dart';
import 'package:flutter_arch_demo/utils/http.dart';
import 'package:flutter_arch_demo/vm/MainViewModel.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              ProviderWidget<MainViewModel>(
                viewModel: MainViewModel(),
                onReady: (viewModel){ //组件初始化之后
                  viewModel.loadData(); //通过provider调用viewModel加载数据
                },
                builder: (context, viewModel, child){
                  return _buildMainWidget(viewModel.mainModel); //渲染首页组件, 传入数据
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainWidget(MainModel mainModel) { //渲染首页组件
    if(mainModel == null){
      return Container(height: 200, child: Center(child: Text("loading.."),),);
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(mainModel.title), //标题
          Image.network(mainModel.image, height: 100, fit: BoxFit.fill,),
          ListView.builder(
            padding: EdgeInsets.all(30),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: mainModel.list.length,
            itemBuilder: (context, index){
              var subject =  mainModel.list[index];
              return ListTile(
                leading: Image.network(subject.image, fit: BoxFit.fill,), //图片图标
                title: Text(subject.id.toString()),
                subtitle: Text(subject.name),
                trailing: Icon(Icons.school), //设置后置图标
              );
            },
          ),
        ],
      ),
    );
  }
}
