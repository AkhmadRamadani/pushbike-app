import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/modules/event/enums/status_kolektifitas.enum.event.dart';
import 'package:pushbike_app/modules/event/enums/status_registered.enum.event.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';

class ThisMonthEventCardComponent extends StatelessWidget {
  final DatumEvent event;

  const ThisMonthEventCardComponent({
    super.key,
    required this.event,
  });

  StatusRegisteredEnumEvent getStatusRegistered() {
    if (event.isRegistered ?? false) {
      switch (event.registrationStatus) {
        case 'pending':
          return StatusRegisteredEnumEvent.pending;
        case 'approved':
          return StatusRegisteredEnumEvent.approved;
        case 'rejected':
          return StatusRegisteredEnumEvent.rejected;
        default:
          return StatusRegisteredEnumEvent.notRegistered;
      }
    } else {
      return StatusRegisteredEnumEvent.notRegistered;
    }
  }

  StatusKolektifitasEnumEvent getStatusKolektifitas() {
    if (event.kategori == 'internal') {
      return StatusKolektifitasEnumEvent.internal;
    }
    if (event.isKolektif == 1) {
      return StatusKolektifitasEnumEvent.kolektif;
    } else {
      return StatusKolektifitasEnumEvent.mandiri;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        width: 212.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: NetworkImage(event.foto ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Visibility(
                  visible: event.isRegistered ?? false,
                  child: Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        children: [
                          Iconify(
                            getStatusRegistered().icon,
                            color: getStatusRegistered().color,
                            size: 12.sp,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            getStatusRegistered().label,
                            style: AppTextStyles.captionLimited10Semibold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Text(
                event.judul ?? "",
                style: AppTextStyles.body14Semibold.copyWith(
                  color: ColorConst.textColour90,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Iconify(
                  Majesticons.location_marker,
                  size: 12.sp,
                  color: ColorConst.textColour50,
                ),
                const SizedBox(width: 4),
                Text(
                  event.tempatRace ?? "",
                  style: AppTextStyles.captionLimited10Regular.copyWith(
                    color: ColorConst.textColour50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Iconify(
                  Mdi.calendar_month_outline,
                  size: 12.sp,
                  color: ColorConst.textColour50,
                ),
                const SizedBox(width: 4),
                Text(
                  event.tanggalRace?.toHumanReadableDateString() ?? "-",
                  style: AppTextStyles.captionLimited10Regular.copyWith(
                    color: ColorConst.textColour50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${event.harga?.toRupiahWithFree()}',
                    style: AppTextStyles.caption12Semibold,
                  ),
                ),
                SizedBox(width: 4.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusKolektifitas().color,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Text(
                    getStatusKolektifitas() ==
                            StatusKolektifitasEnumEvent.internal
                        ? '${event.poin} Poin'
                        : getStatusKolektifitas().labelShort,
                    style: AppTextStyles.captionLimited10Bold.copyWith(
                      color: getStatusKolektifitas().textColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
