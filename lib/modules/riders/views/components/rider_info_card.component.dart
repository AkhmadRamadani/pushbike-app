import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';

class RiderInfoCardComponent extends StatelessWidget {
  final Color backgroundColor;
  final String imageAsset;
  final String title;
  final String description;
  final TextAlign textAlign;
  final bool isImageFirst;
  final Function()? onTap;

  const RiderInfoCardComponent({
    super.key,
    required this.backgroundColor,
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.textAlign,
    this.isImageFirst = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 172.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment:
              isImageFirst ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children:
              isImageFirst ? _buildImageFirstLayout() : _buildTextFirstLayout(),
        ),
      ),
    );
  }

  List<Widget> _buildImageFirstLayout() {
    return [
      _buildImage(),
      _buildText(),
    ];
  }

  List<Widget> _buildTextFirstLayout() {
    return [
      _buildText(),
      _buildImage(),
    ];
  }

  Widget _buildImage() {
    return Expanded(
      child: Container(
        height: 172.h,
        alignment: isImageFirst ? Alignment.bottomLeft : Alignment.bottomRight,
        margin: EdgeInsets.only(
          top: 8.h,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: textAlign == TextAlign.end
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.h222Semibold.copyWith(
                color: Colors.white,
              ),
              textAlign: textAlign,
            ),
            Text(
              description,
              style: AppTextStyles.caption12Regular.copyWith(
                color: Colors.white,
              ),
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}