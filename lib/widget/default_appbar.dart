import 'package:flutter/material.dart';

//默认的AppBar
class DefaultAppBar {

  final String title;
  final bool canBack;

  DefaultAppBar({this.title, this.canBack = true});

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: canBack,
    );
  }

}