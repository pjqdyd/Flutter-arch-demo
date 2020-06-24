
import 'dart:convert';

import 'package:flutter_arch_demo/utils/Http.dart';
import 'package:flutter_arch_demo/common/Urls.dart';
import 'package:flutter_arch_demo/vm/base/base_vm.dart';

class MainViewModel extends BaseViewModel{

  void loadData() { //初始加载数据
   Http().get(Urls.mainPageUrl, {},
   success: (json){
     print(jsonEncode(json).toString());
   }, 
   fail: (reason, statuscode){},
   after: (){});
  }

}