## flutter_arch_demo Flutter的基础项目架构

### 开发环境:
  > Flutter v1.12.13<br>

### 项目结构:
```
lib
 ├─common               通用common类
 ├─model                各个页面的数据模型实体类对象
 ├─view                 页面组件的存放目录
 ├─provider             provider状态管理
 ├─utils                工具类目录
 ├─router               路由目录
 ├─widget               全局公用组件目录
 └─main.dart            main.dart入口主类

```

### 如何运行:
   1. 确保安装好FlutterSdk开发环境,cmd查看命令`flutter doctor`.

   2. 在项目根目录下运行`flutter pub get`下载依赖包.

   3. 连接好设备后, 在项目目录下运行`flutter run`即可.

   (参考: [flutter中文网](https://flutterchina.club/get-started/install/))