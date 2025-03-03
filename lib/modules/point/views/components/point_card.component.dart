import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/modules/level/models/responses/rider_history_points.response.model.dart';

class PointCardComponent extends StatelessWidget {
  final DatumRiderHistoryPoint item;

  const PointCardComponent({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.date?.toHumanReadableDateStringMonthShort() ?? '-',
            style: AppTextStyles.body14Semibold,
          ),
          SizedBox(height: 8.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: item.points?.length ?? 0,
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
            itemBuilder: (context, index) =>
                _buildPointRow(item.points![index]),
          ),
        ],
      ),
    );
  }

  Widget _buildPointRow(Point itemPoint) {
    return Row(
      children: [
        _buildIconContainer(),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            itemPoint.historyPoin ?? "-",
            style: AppTextStyles.body14Regular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          "+${itemPoint.poin ?? 0} Poin",
          style: AppTextStyles.body14Semibold,
        ),
      ],
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: ColorConst.green30,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          AssetConst.icWhistle,
          width: 20.sp,
        ),
      ),
    );
  }
}
