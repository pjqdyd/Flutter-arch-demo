
import 'dart:convert';

import 'package:flutter_arch_demo/model/MainModel.dart';
import 'package:flutter_arch_demo/utils/Http.dart';
import 'package:flutter_arch_demo/common/Urls.dart';
import 'package:flutter_arch_demo/vm/base/BaseViewModel.dart';

///首页的ViewModel对象
class MainViewModel extends BaseViewModel{

  MainModel mainModel;

  void loadData() { //初始加载数据
   Http().get(Urls.mainPageUrl, {},
   success: (json){
     //这个json是dynamic类型, 但是dio帮我们自动序列化成json了, 不是String类型,就不需要jsonEncoding()
     print("请求首页数据成功: code: " + json['code'].toString() + ", message: " + json['message'].toString());
     this.mainModel = MainModel.fromJson(json['data']); //将json数据还原成model对象
     notifyListeners(); //通知ProviderWidget数据更新
   }, 
   fail: (reason, statuscode){},
   after: (){});
  }

}