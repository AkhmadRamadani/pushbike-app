import 'package:pushbike_app/core/behavior/no_scroll_glow_behavior.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class GeneralEmptyErrorWidget extends StatelessWidget {
  final String descText;
  final String titleText;
  final double? customHeightContent;
  final String customUrlImage;
  final double heightImage;
  final double? widthImage;
  final TextStyle? customDescTextStyle;
  final TextStyle? customTitleTextStyle;
  final Function()? onRefresh;
  final String type;
  final bool isCentered;
  final bool removeTitle;

  /// jik ini null maka akan ada button yang muncul
  final Widget? additionalWidgetBellowTextDesc;

  const GeneralEmptyErrorWidget({
    super.key,
    this.descText = 'Maaf, saat ini data kamu tidak tersedia',
    this.titleText = 'Data tidak tersedia',
    this.customDescTextStyle,
    this.customTitleTextStyle,
    this.customHeightContent,
    this.onRefresh,
    this.customUrlImage = AssetConst.drawEmptyWidget,
    this.isCentered = true,
    this.additionalWidgetBellowTextDesc,
  })  : heightImage = 0,
        widthImage = 0,
        type = 'default',
        removeTitle = false;

  const GeneralEmptyErrorWidget.custom({
    super.key,
    this.descText = 'Maaf, saat ini data kamu tidak tersedia',
    this.titleText = 'Data tidak tersedia',
    this.customDescTextStyle,
    this.customHeightContent,
    this.customTitleTextStyle,
    required this.heightImage,
    required this.widthImage,
    this.customUrlImage = '',
    this.isCentered = true,
    this.onRefresh,
    this.additionalWidgetBellowTextDesc,
  })  : type = 'custom',
        removeTitle = false;

  const GeneralEmptyErrorWidget.removeTitle({
    super.key,
    this.descText = 'Maaf, saat ini data kamu tidak tersedia',
    this.customDescTextStyle,
    this.customHeightContent,
    this.onRefresh,
    this.customUrlImage = '',
    this.isCentered = true,
    this.additionalWidgetBellowTextDesc,
  })  : heightImage = 0,
        widthImage = 0,
        type = 'default',
        titleText = '',
        customTitleTextStyle = null,
        removeTitle = true;

  @override
  Widget build(BuildContext context) {
    return (onRefresh != null)
        ? RefreshIndicator(
            onRefresh: () async {
              onRefresh!();
            },
            child: ScrollConfiguration(
              behavior: NoScrollGlowBehavior(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: _content(context),
              ),
            ),
          )
        : _content(context);
  }

  Widget _content(BuildContext context) {
    return SizedBox(
      height: onRefresh == null ? null : customHeightContent ?? 1.sh / 1.4,
      child: Column(
        mainAxisAlignment:
            isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                customUrlImage.isNotEmpty &&
                (customUrlImage.getExtension() == 'png' ||
                    customUrlImage.getExtension() == 'jpg' ||
                    customUrlImage.getExtension() == 'jpeg'),
            widgetBuilder: (context) => Image.asset(
              customUrlImage.isEmpty
                  ? AssetConst.drawDialogQuestion
                  : customUrlImage,
              width: 177.h,
              fit: BoxFit.fitHeight,
            ),
            fallbackBuilder: (context) => Conditional.single(
              context: context,
              conditionBuilder: (context) =>
                  customUrlImage.isNotEmpty &&
                  customUrlImage.getExtension() == 'json',
              widgetBuilder: (context) => Lottie.asset(
                customUrlImage.isEmpty
                    ? AssetConst.emptyAnimation
                    : customUrlImage,
                width: 0.8.sw,
              ),
              fallbackBuilder: (context) => Lottie.asset(
                AssetConst.emptyAnimation,
                width: 0.8.sw,
              ),
            ),
          ),
          // SizedBox(
          //   height: 25.h,
          //   width: double.infinity,
          // ),
          !removeTitle
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    titleText,
                    style: customTitleTextStyle ??
                        TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                    textAlign: TextAlign.center,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: !removeTitle ? 6.h : 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              descText,
              style: customDescTextStyle ??
                  TextStyle(
                    fontFamily: 'openSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          additionalWidgetBellowTextDesc ?? const SizedBox()
        ],
      ),
    );
  }
}
