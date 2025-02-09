import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class CustomTabbarWidget extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;
  final EdgeInsetsGeometry padding;

  const CustomTabbarWidget({
    super.key,
    required this.tabController,
    required this.tabs,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorConst.blue100, // Default color
      labelColor: ColorConst.blue100,
      labelStyle: AppTextStyles.body14Bold.copyWith(
        color: ColorConst.blue100,
        fontWeight: FontWeight.w600,
      ),
      splashFactory: NoSplash.splashFactory,
      indicatorWeight: 4.h,
      padding: padding,
      tabs: tabs,
    );
  }
}
