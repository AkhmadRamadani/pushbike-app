import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:pushbike_app/modules/jadwal/repositories/jadwal.repository.dart';

class JadwalController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static JadwalController get to => Get.find<JadwalController>();
  TabController? tabController;

  DateTime focusedDay = DateTime.now();
  DateTime firstDay = DateTime(2023);
  DateTime lastDay = DateTime(2030);

  JadwalRepository jadwalRepository = JadwalRepository();

  Rx<UIState<List<CalendarEvent>>> eventCalendar =
      const UIState<List<CalendarEvent>>.idle().obs;
  Rx<UIState<List<DatumEventCalendar>>> ujianData =
      const UIState<List<DatumEventCalendar>>.idle().obs;
  Rx<UIState<PointModel>> pointData = const UIState<PointModel>.idle().obs;

  DatumEventCalendar? selectedEvent;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getEventCalendar();
    getUjian();
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  Future<void> getEventCalendar() async {
    eventCalendar.value = const UIState.loading();
    pointData.value = const UIState.loading();
    try {
      final response =
          await jadwalRepository.getCalendarEvent(date: focusedDay);
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.event != null) {
        eventCalendar.value = UIState.success(data: response.data!.event!);
        pointData.value = UIState.success(
          data: response.data!.point!,
        );
      } else {
        eventCalendar.value = UIState.error(
          message: response.message ?? 'Failed to fetch event calendar.',
        );
        pointData.value = UIState.error(
          message: response.message ?? 'Failed to fetch event calendar.',
        );
      }
    } catch (e) {
      eventCalendar.value = UIState.error(message: e.toString());
      pointData.value = UIState.error(message: e.toString());
    }
  }

  DateTime onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    focusedDay = selectedDay;

    final events = eventCalendar.value.dataSuccess();
    if (events != null && events.isNotEmpty) {
      final eventIndex = selectedDay.day - 1;
      if (eventIndex >= 0 && eventIndex < events.length) {
        final eventData = events[eventIndex].data;
        selectedEvent =
            eventData != null && eventData.isNotEmpty ? eventData.first : null;
      } else {
        selectedEvent = null;
      }
    } else {
      selectedEvent = null;
    }

    update(['informationHeader', 'informationBody', "detailInformation"]);
    return focusedDay;
  }

  void previousMonth() {
    focusedDay = DateTime(focusedDay.year, focusedDay.month - 1);
    eventCalendar.value = const UIState.loading();

    selectedEvent = null;
    update([
      'informationHeader',
      'informationBody',
      "detailInformation",
      "calendarHeader"
    ]);
    getEventCalendar();
  }

  void nextMonth() {
    focusedDay = DateTime(focusedDay.year, focusedDay.month + 1);
    eventCalendar.value = const UIState.loading();

    selectedEvent = null;
    update([
      'informationHeader',
      'informationBody',
      "detailInformation",
      "calendarHeader"
    ]);
    getEventCalendar();
  }

  Future<void> getUjian() async {
    ujianData.value = const UIState.loading();
    try {
      final response = await jadwalRepository.getUjianData();
      if (response.statusCode == 200 && response.data != null) {
        if ((response.data!.data ?? []).isEmpty) {
          ujianData.value = const UIState.empty(
            message: 'Data not found',
          );
        } else {
          ujianData.value = UIState.success(data: response.data!.data!);
        }
      } else {
        ujianData.value = UIState.error(
          message: response.message ?? 'Data not found',
        );
      }
    } catch (e) {
      ujianData.value = UIState.error(message: e.toString());
    }
  }
}
