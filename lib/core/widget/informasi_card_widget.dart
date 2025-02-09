import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:iconify_flutter/icons/eos_icons.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/modules/information/models/responses/get_pengumuman_data.response.model.dart';

enum MemoCardType {
  normal,
  pinned,
}

enum MemoStatusRead {
  read,
  unread,
}

class InformasiCardWidget extends StatelessWidget {
  final MemoCardType type;
  final void Function()? onTap;
  final MemoStatusRead read;
  final bool changeBackground;
  final DatumPengumumanModel data;

  const InformasiCardWidget({
    super.key,
    required this.type,
    required this.onTap,
    required this.read,
    this.changeBackground = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w),
        color: changeBackground
            ? (read == MemoStatusRead.read ? Colors.white : ColorConst.blue20)
            : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildMemoTitle(context, read, data),
                          ),
                          SizedBox(width: 3.w),
                          _buildIcon(
                            context,
                            type,
                            MemoCardType.pinned,
                            EosIcons.pin,
                            ColorConst.dangerMain,
                          ),
                          SizedBox(width: 3.w),
                          _buildIcon(
                            context,
                            read,
                            MemoStatusRead.unread,
                            Ic.baseline_fiber_new,
                            ColorConst.blue100,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                _buildDate(context, read,
                    data.createdAt?.toDayMonthYearString() ?? ""),
              ],
            ),
            SizedBox(height: 4.h),
            _buildDescription(
              data.deskripsi ?? '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoTitle(
      BuildContext context, MemoStatusRead read, DatumPengumumanModel data) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) => read == MemoStatusRead.unread,
      widgetBuilder: (context) => Text(
        data.judul ?? '-',
        style: AppTextStyles.body14Regular.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      fallbackBuilder: (context) => Text(
        data.judul ?? '-',
        style: AppTextStyles.body14Regular.copyWith(fontSize: 14.sp),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context,
    dynamic value,
    dynamic expectedValue,
    String icon,
    Color color,
  ) {
    return ConditionalSwitch.single(
      context: context,
      valueBuilder: (context) => value,
      caseBuilders: {
        expectedValue: (context) => Iconify(icon, color: color, size: 20.sp),
      },
      fallbackBuilder: (context) => const SizedBox(),
    );
  }

  Widget _buildDate(BuildContext context, MemoStatusRead read, String date) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) => read == MemoStatusRead.unread,
      widgetBuilder: (context) => Text(
        date,
        style: AppTextStyles.body14Semibold.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      fallbackBuilder: (context) => Text(
        date,
        style: AppTextStyles.body14Regular.copyWith(fontSize: 12.sp),
      ),
    );
  }

  Widget _buildDescription(String deskripsi) {
    return Text(
      deskripsi,
      style: AppTextStyles.body14Regular.copyWith(
        fontSize: 12.sp,
        color: ColorConst.textColour50,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
