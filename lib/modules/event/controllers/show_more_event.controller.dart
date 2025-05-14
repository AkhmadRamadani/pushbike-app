import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';
import 'package:pushbike_app/modules/event/repositories/event.repository.dart';

enum EventDateCategory {
  monthly,
  others,
}

class ShowMoreEventController extends GetxController {
  static const _pageSize = 10;
  final EventRepository _eventRepository = EventRepository();
  DateTime current = DateTime.now();

  final PagingController<int, DatumEvent> pagingController =
      PagingController(firstPageKey: 1);

  EventCategory eventCategory = EventCategory.all;
  EventDateCategory eventDateCategory = EventDateCategory.monthly;
  String? keyword;

  String get appBarTitle {
    switch (eventCategory) {
      case EventCategory.all:
        if (keyword != null && keyword!.isNotEmpty) {
          return 'Hasil Pencarian: $keyword';
        }
        return 'Semua Event';
      case EventCategory.internal:
        switch (eventDateCategory) {
          case EventDateCategory.monthly:
            return 'Event Internal Bulan Ini';
          case EventDateCategory.others:
            return 'Event Internal Lainnya';
        }
      case EventCategory.external:
        switch (eventDateCategory) {
          case EventDateCategory.monthly:
            return 'Event Eksternal Bulan Ini';
          case EventDateCategory.others:
            return 'Event Eksternal Lainnya';
        }
    }
  }

  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    if (args != null) {
      eventCategory = args['eventType'] ?? EventCategory.all;
      eventDateCategory =
          args['eventDateCategory'] ?? EventDateCategory.monthly;
      keyword = args['keyword'];
    } else {
      Get.back();
      return;
    }
    pagingController.addPageRequestListener((pageKey) {
      getEventData(
        pageKey: pageKey,
        isRefresh: false,
        category: eventCategory,
        startDate: eventDateCategory == EventDateCategory.monthly
            ? DateTime(current.year, current.month)
            : null,
        endDate: eventDateCategory == EventDateCategory.monthly
            ? DateTime(current.year, current.month + 1)
            : null,
        keyword: keyword,
      );
    });
  }

  Future<void> getEventData({
    int pageKey = 1,
    bool isRefresh = false,
    EventCategory category = EventCategory.all,
    DateTime? startDate,
    DateTime? endDate,
    String? keyword,
  }) async {
    await _fetchEvents(
      category: category,
      startDate: startDate,
      endDate: endDate,
      isRefresh: isRefresh,
      pageKey: pageKey,
      keyword: keyword,
    );
  }

  Future<void> _fetchEvents({
    required EventCategory category,
    DateTime? startDate,
    DateTime? endDate,
    bool isRefresh = false,
    int pageKey = 1,
    String? keyword,
  }) async {
    try {
      final response = await _eventRepository.getListEvent(
        page: pageKey,
        limit: _pageSize,
        category: category,
        startDate: startDate,
        endDate: endDate,
        keyword: keyword,
      );

      final isLastPage = response.data?.data?.isEmpty ?? true;
      if (isLastPage) {
        pagingController.appendLastPage(response.data?.data ?? []);
      } else {
        pagingController.appendPage(
          response.data?.data ?? [],
          pageKey + 1,
        );
      }
    } catch (e) {
      pagingController.error = e;
      if (isRefresh) {
        pagingController.refresh();
      }
    }
  }
}
