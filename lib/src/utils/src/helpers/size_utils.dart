import 'package:activity_monitor/src/utils/src/helpers/ui_dimens.dart';
import 'package:flutter/material.dart';

class WidthSpaceBox extends StatefulWidget {
  const WidthSpaceBox({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  State<WidthSpaceBox> createState() => _WidthSpaceBoxState();
}

class _WidthSpaceBoxState extends State<WidthSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getWidth(context.screenWidth, widget.size).widthBox;
  }
}

class HeightSpaceBox extends StatefulWidget {
  const HeightSpaceBox({
    Key? key,
    required this.size,
  }) : super(key: key);
  final double size;
  @override
  State<HeightSpaceBox> createState() => _HeightSpaceBoxState();
}

class _HeightSpaceBoxState extends State<HeightSpaceBox> {
  @override
  Widget build(BuildContext context) {
    return Utils.getHeight(context.screenHeight, widget.size).heightBox;
  }
}

class Utils {
  static double getScreenWidth(BuildContext context, double y) {
    return context.screenWidth * (y / 360.0);
  }

  static double getScreenHeight(BuildContext context, double y) {
    return context.screenHeight * (y / 752.0);
  }

  static double getWidth(double x, double y) {
    return x * (y / 360.0);
  }

  static double getHeight(double x, double y) {
    return x * (y / 752.0);
  }
}
