import 'package:flutter/material.dart';

class UIDimens {
  static const double zero = 0.0;
  static const double padding = 8.0;
  static const double padding75 = 0.75;
  static const double padding50 = 0.50;
  static const double size1 = 1.0;
  static const double size2 = 2.0;
  static const double size3 = 3.0;
  static const double size4 = 4.0;
  static const double size5 = 5.0;
  static const double size6 = 6.0;
  static const double size8 = 8.0;
  static const double size10 = 10.0;
  static const double size12 = 12.0;
  static const double size13 = 13.0;
  static const double size14 = 14.0;
  static const double size15 = 15.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size23 = 23.0;
  static const double size25 = 25.0;
  static const double size28 = 25.0;
  static const double size30 = 30.0;
  static const double size33 = 33.0;
  static const double size35 = 35.0;
  static const double size38 = 38.0;
  static const double size40 = 40.0;
  static const double size45 = 45.0;
  static const double size50 = 50.0;
  static const double size55 = 55.0;
  static const double size60 = 60.0;
  static const double size65 = 65.0;
  static const double size70 = 70.0;
  static const double size80 = 80.0;
  static const double size90 = 90.0;
  static const double size100 = 100.0;
  static const double size110 = 110.0;
  static const double size130 = 130.0;
  static const double size150 = 150.0;
  static const double size160 = 160.0;
  static const double size170 = 170.0;
  static const double size180 = 180.0;
  static const double size190 = 190.0;
  static const double size200 = 200.0;
  static const double size230 = 230.0;
  static const double size250 = 250.0;
}

extension ContextUtils on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension PaddingUtils on Widget {
  Padding paddingAll(
    double value,
  ) =>
      Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );

  Padding paddingLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
}

extension SizeBoxExtension on double {
  Widget get widthBox => SizedBox(width: this);

  Widget get heightBox => SizedBox(height: this);
}
