import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

///封装ProviderWidget, T viewModel是要监听的VM视图数据模型
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
    return ChangeNotifierProvider<T>( //监听viewModel的更新
      create: (_) => widget.viewModel,
      child: Consumer(
          builder: widget.builder, //消费通知, 调用builder方法
          child: widget.child,
        ),
    );
  }

}