import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
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
                  //调用viewModel(这里就是泛型MianViewModel)的loadData加载数据, 这样数据会通过notifyListeners()通知变化;
                  //这样由于ProviderWidget封装了监听和消费通知, 就会回调下面的builder,重新构建数据
                  viewModel.loadData(); 
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
          CachedNetworkImage(imageUrl: mainModel.image, height: 100, fit: BoxFit.fill,), //图片
          ListView.builder(
            padding: EdgeInsets.all(30),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: mainModel.list.length,
            itemBuilder: (context, index){
              var subject =  mainModel.list[index];
              return ListTile(
                leading: CachedNetworkImage(
                    imageUrl: subject.image,
                    placeholder: (context, url) => Icon(Icons.image), //占位组件
                    errorWidget: (context, url, error) => Icon(Icons.error), //出错
                ),
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
