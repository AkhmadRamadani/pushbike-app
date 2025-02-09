import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class Separator extends StatelessWidget {
  final double? indent;
  final double? height;
  final double? thickness;
  final Color? color;

  const Separator({
    super.key,
    this.indent = 0,
    this.height = 0,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  });

  const Separator.i15({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 15,
        height = 0;

  const Separator.i20({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 20,
        height = 0;

  const Separator.i30({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 30,
        height = 0;

  const Separator.h10({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 10;

  const Separator.h5({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 5;

  const Separator.h0({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 0;

  const Separator.h20({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 20;

  const Separator.h30({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 30;

  const Separator.h40({
    super.key,
    this.thickness = 1,
    this.color = ColorConst.textColour20,
  })  : indent = 0,
        height = 40;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      height: height?.w,
      indent: indent?.w,
      endIndent: indent?.w,
    );
  }
}
