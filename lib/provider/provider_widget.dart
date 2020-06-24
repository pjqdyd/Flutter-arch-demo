import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

///封装ProviderWidget, T model是要监听的数据模型
class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget{

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onReady;

  ProviderWidget({
    this.builder,
    this.child,
    this.model,
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
      widget.onReady(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer(
          builder: widget.builder,
          child: widget.child,
        ),
    );
  }

}