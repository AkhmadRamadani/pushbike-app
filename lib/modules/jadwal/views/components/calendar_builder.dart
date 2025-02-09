import 'package:flutter/material.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/app_text_styles_const.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

class CustomCalendarBuilder {
  /// Builds the custom `CalendarBuilders` for the TableCalendar.
  static CalendarBuilders create({
    required List<CalendarEvent> event,
  }) {
    return CalendarBuilders(
      dowBuilder: (context, day) => Text(
        DateFormat.E('id').format(day),
        style: AppTextStyles.caption12Semibold,
        textAlign: TextAlign.center,
      ),
      todayBuilder: (context, day, focusedDay) => buildDayUI(
        day,
        backgroundColor: ColorConst.blue30,
        event: event[day.day - 1],
      ),
      defaultBuilder: (context, day, focusedDay) => buildDayUI(
        day,
        backgroundColor: Colors.transparent,
        event: event[day.day - 1],
      ),
      selectedBuilder: (context, day, focusedDay) => buildDayUI(
        day,
        backgroundColor: ColorConst.blue30,
        event: event[day.day - 1],
      ),
    );
  }

  static Widget buildDayUI(
    DateTime day, {
    required CalendarEvent event,
    Color? backgroundColor,
  }) {
    Color badgeColor = Colors.transparent;
    if (event.data != null) {
      if (event.data!.isNotEmpty) {
        var data = event.data!.first;
        if (data.kategori == EventCategory.latihan) {
          badgeColor = ColorConst.successMain;
        }
        if (data.kategori == EventCategory.ujian) {
          badgeColor = ColorConst.dangerMain;
        }
      }
    }
    return Badge(
      alignment: Alignment.bottomCenter,
      backgroundColor: badgeColor,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            day.day.toString(),
            style: AppTextStyles.body14Semibold.copyWith(
              color: ColorConst.textColour90,
            ),
          ),
        ),
      ),
    );
  }
}
