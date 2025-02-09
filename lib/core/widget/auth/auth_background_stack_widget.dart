import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class AuthBackgroundStackWidget extends StatelessWidget {
  const AuthBackgroundStackWidget({
    super.key,
    this.backgroundPath = AssetConst.loginBackground,
    this.width = 200,
    this.left,
    this.top,
    this.bottom,
    this.right,
    this.expandedContentSize,
    this.expandedGradientSize,
  });

  final String backgroundPath;
  final double width;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;
  final int? expandedGradientSize;
  final int? expandedContentSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: expandedGradientSize ?? 4,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: ColorConst.gradientBlue,
                ),
                width: double.infinity,
              ),
            ),
          ],
        ),
        Positioned(
          left: left,
          top: top,
          bottom: bottom,
          right: right,
          child: Image.asset(
            backgroundPath,
            width: width.w,
          ),
        ),
      ],
    );
  }
}
