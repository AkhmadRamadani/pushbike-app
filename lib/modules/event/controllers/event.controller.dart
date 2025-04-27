import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';
import 'package:pushbike_app/modules/event/repositories/event.repository.dart';

class EventController extends GetxController
    with GetSingleTickerProviderStateMixin {
      static EventController get to => Get.find();
  TabController? tabController;
  static const _pageSize = 10;
  final EventRepository _eventRepository = EventRepository();
  DateTime current = DateTime.now();

  // UI states
  Rx<UIState<List<DatumEvent>>> eventDataExternalMonthlyState =
      const UIState<List<DatumEvent>>.idle().obs;
  Rx<UIState<List<DatumEvent>>> eventDataInternalMonthlyState =
      const UIState<List<DatumEvent>>.idle().obs;
  Rx<UIState<List<DatumEvent>>> eventDataExternalOthersState =
      const UIState<List<DatumEvent>>.idle().obs;
  Rx<UIState<List<DatumEvent>>> eventDataInternalOthersState =
      const UIState<List<DatumEvent>>.idle().obs;

  // Paging controllers
  final PagingController<int, DatumEvent> pagingControllerExternalMonthly =
      PagingController(firstPageKey: 0);
  final PagingController<int, DatumEvent> pagingControllerInternalMonthly =
      PagingController(firstPageKey: 0);
  final PagingController<int, DatumEvent> pagingControllerExternalOthers =
      PagingController(firstPageKey: 0);
  final PagingController<int, DatumEvent> pagingControllerInternalOthers =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    getEventThisMonthExternalData(isRefresh: true);
    getEventThisMonthInternalData(isRefresh: true);
    getEventExternalOthersData(isRefresh: true);
    getEventInternalOthersData(isRefresh: true);

    pagingControllerExternalMonthly.addPageRequestListener((pageKey) {
      getEventThisMonthExternalData(
        pageKey: pageKey,
      );
    });

    pagingControllerInternalMonthly.addPageRequestListener((pageKey) {
      getEventThisMonthInternalData(
        pageKey: pageKey,
      );
    });

    pagingControllerExternalOthers.addPageRequestListener((pageKey) {
      getEventExternalOthersData(
        pageKey: pageKey,
      );
    });

    pagingControllerInternalOthers.addPageRequestListener((pageKey) {
      getEventInternalOthersData(
        pageKey: pageKey,
      );
    });
    super.onInit();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  DateTime getStartDate() => DateTime(current.year, current.month, 1);
  DateTime getEndDate() =>
      DateTime(current.year, current.month + 1, 0, 23, 59, 59);

  Future<void> _fetchEvents({
    required EventCategory category,
    DateTime? startDate,
    DateTime? endDate,
    required Rx<UIState<List<DatumEvent>>> state,
    required PagingController<int, DatumEvent> pagingController,
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    if (isRefresh) {
      state.value = const UIState.loading();
    }
    try {
      final response = await _eventRepository.getListEvent(
        page: pageKey,
        limit: _pageSize,
        category: category,
        startDate: startDate,
        endDate: endDate,
      );

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        if (isRefresh) {
          pagingController.refresh();
        } else {
          pagingController.appendLastPage(response.data!.data!);
        }
        state.value = UIState.success(data: response.data!.data!);
      } else {
        state.value = UIState.error(
          message: response.message ?? 'Failed to fetch events.',
        );
      }
    } catch (e) {
      state.value = UIState.error(message: e.toString());
    }
  }

  Future<void> getEventThisMonthExternalData({
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    await _fetchEvents(
      category: EventCategory.external,
      startDate: getStartDate(),
      endDate: getEndDate(),
      state: eventDataExternalMonthlyState,
      pagingController: pagingControllerExternalMonthly,
      isRefresh: isRefresh,
      pageKey: pageKey,
    );
  }

  Future<void> getEventThisMonthInternalData({
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    await _fetchEvents(
      category: EventCategory.internal,
      startDate: getStartDate(),
      endDate: getEndDate(),
      state: eventDataInternalMonthlyState,
      pagingController: pagingControllerInternalMonthly,
      isRefresh: isRefresh,
      pageKey: pageKey,
    );
  }

  Future<void> getEventInternalOthersData({
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    await _fetchEvents(
      category: EventCategory.internal,
      state: eventDataInternalOthersState,
      pagingController: pagingControllerInternalOthers,
      isRefresh: isRefresh,
      pageKey: pageKey,
    );
  }

  Future<void> getEventExternalOthersData({
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    await _fetchEvents(
      category: EventCategory.external,
      state: eventDataExternalOthersState,
      pagingController: pagingControllerExternalOthers,
      isRefresh: isRefresh,
      pageKey: pageKey,
    );
  }
}
