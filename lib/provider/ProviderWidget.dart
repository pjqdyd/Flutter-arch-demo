import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

///封装ProviderWidget, T viewModel是要监听的VM视图数据模型
///这个封装表示把传入的T viewModel:
/// 提供初始化时的一个onReady方法
/// 包裹进ChangeNotifierProvider组件, 使得该viewModel可以监听到notifyListeners();产生的变化
/// 并用Consumer消费监听, 回调传入的builder函数方法获取更新的viewModel数据
class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget{

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T viewModel;
  final Widget child;
  final Function(T) onReady;

  ProviderWidget({
    this.builder,
    this.child,
    this.viewModel,
    this.onReady,
  });

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier> extends State<ProviderWidget<T>> {

  @override
  void initState() {
    super.initState();
    if(widget.onReady != null){
      widget.onReady(widget.viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>( //监听T viewModel的更新
      create: (_) => widget.viewModel,
      child: Consumer(
          builder: widget.builder, //消费通知, 调用builder方法
          child: widget.child,
        ),
    );
    // Consumer<T>( //等同与上面
    //   builder: (context, viewModel, child){ //消费者提供的方法
    //     return widget.builder(context, viewModel, child); //回调builder方法
    //   },
    //   child: widget.child,
    // );
  }

}