import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class GeneralAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? leadingIcon;
  final List<Widget>? actions;

  const GeneralAppBarWidget({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.backgroundColor,
    this.titleColor,
    this.leadingIcon,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24.r),
        bottomRight: Radius.circular(24.r),
      ),
      child: AppBar(
        backgroundColor: backgroundColor ?? ColorConst.blue100,
        leading: leadingIcon ??
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorConst.textColour00,
              ),
              onPressed: onLeadingPressed ?? () => Get.back(),
            ),
        centerTitle: true,
        title: Text(
          title,
          style: AppTextStyles.h418Bold.copyWith(
            color: titleColor ?? ColorConst.textColour00,
          ),
        ),
        actions: actions,
      ),
    );
  }
}
