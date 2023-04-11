import 'package:flutter/material.dart';

class Layout {
  final BuildContext context;
  bool isLargeScreen = false;
  double? width;
  double? height;
  Layout({required this.context}) {
    final size = MediaQuery.of(context).size;
    isLargeScreen = size.width > 700 ? true : false;
    width = size.width;
    height = size.height;
  }
}
