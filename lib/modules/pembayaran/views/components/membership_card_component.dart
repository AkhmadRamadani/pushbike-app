import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/widget/ordered_list_widget.dart';
import 'package:pushbike_app/core/widget/separator_widget.dart';
import 'package:pushbike_app/modules/pembayaran/models/membership_model.dart';

class ColorModel {
  final Color colorText;
  final Color colorIcon;
  final Color colorButton;

  ColorModel({
    required this.colorText,
    required this.colorIcon,
    required this.colorButton,
  });
}

class MembershipCardComponent extends StatelessWidget {
  final MembershipModel membership;

  const MembershipCardComponent({super.key, required this.membership});

  ColorModel _getColorModel() {
    return membership.isComingSoon
        ? ColorModel(
            colorText: ColorConst.textColour60,
            colorIcon: ColorConst.textColour60,
            colorButton: ColorConst.textColour30,
          )
        : ColorModel(
            colorText: ColorConst.textColour90,
            colorIcon: membership.isCurrent
                ? ColorConst.successMain
                : ColorConst.dangerMain,
            colorButton: ColorConst.blueText,
          );
  }

  @override
  Widget build(BuildContext context) {
    final colors = _getColorModel();

    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        gradient: membership.gradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          _buildBackgroundPattern(),
          _buildOverlay(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(colors),
                SizedBox(height: 4.h),
                if (membership.isCurrent)
                  Text(
                    membership.description,
                    style: AppTextStyles.captionLimited10Regular.copyWith(
                      color: colors.colorText,
                    ),
                  ),
                SizedBox(height: 12.h),
                _buildActionButtons(context, colors),
                SizedBox(height: 8.h),
                if (membership.errorText.isNotEmpty)
                  Row(
                    children: [
                      Iconify(
                        MaterialSymbols.warning_rounded,
                        color: ColorConst.dangerMain,
                        size: 14.sp,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        membership.errorText,
                        style: AppTextStyles.captionLimited10Regular.copyWith(
                          color: colors.colorText,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundPattern() {
    return Row(
      children: [
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SvgPicture.asset(
            AssetConst.cardPembayaranPattern,
            width: 180.w,
            height: 180.h,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: double.infinity,
      height: 180.h,
      color: Colors.white.withOpacity(0.1),
    );
  }

  Widget _buildHeader(ColorModel colors) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              membership.title,
              style: AppTextStyles.caption12Semibold.copyWith(
                color: colors.colorText,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              membership.price,
              style: AppTextStyles.largeTitle32Regular.copyWith(
                fontWeight: FontWeight.w600,
                color: colors.colorText,
              ),
            ),
          ],
        ),
        const Spacer(),
        Icon(
          membership.icon,
          color: colors.colorIcon,
          size: 48.sp,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorModel colors) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (membership.hasTerms) {
                _showTermsDialog(context, membership);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "S&K",
                  style: AppTextStyles.body14Regular.copyWith(
                    color: colors.colorButton,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colors.colorButton,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Detail",
                style: AppTextStyles.body14Regular.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showTermsDialog(BuildContext context, MembershipModel membership) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Syarat dan Ketentuan",
                    style: AppTextStyles.h418Semibold.copyWith(
                      color: ColorConst.textColour90,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    membership.title,
                    style: AppTextStyles.body14Regular.copyWith(
                      color: ColorConst.textColour90,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Separator.i15(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: OrderedListWidget(items: membership.terms),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Iconify(
                      MaterialSymbols.close_rounded,
                      color: ColorConst.textColour90,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
