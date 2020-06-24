import 'package:dio/dio.dart';
import 'package:flutter_arch_demo/common/Urls.dart';

//定义成功, 失败, After的回调函数
typedef Success = void Function(dynamic json);
typedef Fail = void Function(String reason, int code);
typedef After = void Function();

// 封装Http工具操作
class Http {
  static Dio _dio;
  static Http _http = new Http();

  Http(){
    if (_dio == null) {
      _dio = _createDio();
    }
  }

  static Http getInstance() {
    return _http;
  }

  Dio _createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      baseUrl: Urls.baseUrl,
      responseType: ResponseType.json,
    ));
    return dio;
  }

  //封装Get方法
  Future<void> get(String uri, Map<String, dynamic> params, {Success success, Fail fail, After after}){
    _dio.get(uri, queryParameters: params).then((response){

      if(response.statusCode == 200){ //响应成功
        if(success != null){
          success(response.data); //调用成功的回调函数,并传入数据
        }
      }else{ //响应失败
        if(fail != null){ 
          fail(response.statusMessage, response.statusCode); //调用失败的回调函数
        }
      }

      if(after != null){ //总会调用After的回调
        after(); 
      }

    });
    return Future.value();
  }
}
