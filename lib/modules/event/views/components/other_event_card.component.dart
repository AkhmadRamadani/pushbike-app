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

class OtherEventCardComponent extends StatelessWidget {
  final DatumEvent event;
  final Color statusColor;
  final Color labelBackgroundColor;

  const OtherEventCardComponent({
    super.key,
    required this.event,
    this.statusColor = ColorConst.successMain,
    this.labelBackgroundColor = ColorConst.dangerSurface,
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
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 12.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 90.w,
                  height: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: ColorConst.textColour10,
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
                        vertical: 2.h,
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
                            size: 10.sp,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            getStatusRegistered().label,
                            style: AppTextStyles.captionLimited10Semibold
                                .copyWith(fontSize: 8.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SizedBox(
                height: 90.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
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
                    Column(
                      children: [
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
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
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
                              event.tanggalRace?.toHumanReadableDateString() ??
                                  "",
                              style: AppTextStyles.captionLimited10Regular
                                  .copyWith(
                                color: ColorConst.textColour50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${event.harga?.toRupiahWithFree()}',
                            style: AppTextStyles.title16Semibold,
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
            ),
          ],
        ),
      ),
    );
  }
}
