import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/repositories/riders_checkpoint.repository.dart';

class RidersCheckpointController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static RidersCheckpointController get to =>
      Get.find<RidersCheckpointController>();
  TabController? tabController;

  final RidersCheckpointRepository _checkpointRepository =
      RidersCheckpointRepository();

  Rx<UIState<List<DatumRiderCheckpoint>>> listRiderCheckpointBasicState =
      const UIState<List<DatumRiderCheckpoint>>.idle().obs;

  Rx<UIState<List<DatumRiderCheckpoint>>> listRiderCheckpointTestState =
      const UIState<List<DatumRiderCheckpoint>>.idle().obs;

  static const _pageSize = 10;

  final PagingController<int, DatumRiderCheckpoint> pagingControllerBasic =
      PagingController(firstPageKey: 0);

  final PagingController<int, DatumRiderCheckpoint> pagingControllerTest =
      PagingController(firstPageKey: 0);

  DateTime selectedDate = DateTime.now();

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
    getRiderCheckpointBasic(isRefresh: true);
    getRiderCheckpointTest(isRefresh: true);
    pagingControllerBasic.addPageRequestListener((pageKey) {
      getRiderCheckpointBasic(pageKey: pageKey, isLoadMore: true);
    });
    pagingControllerTest.addPageRequestListener((pageKey) {
      getRiderCheckpointTest(pageKey: pageKey, isLoadMore: true);
    });
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  Future<void> getRiderCheckpointBasic({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    if (isRefresh) {
      listRiderCheckpointBasicState.value = const UIState.loading();
      pagingControllerBasic.refresh();
    }
    try {
      final response = await _checkpointRepository.getListRiderCheckpoint(
        page: pageKey,
        limit: _pageSize,
        kategori: RidersCheckpointKategori.basic,
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        if (isRefresh) {
          pagingControllerBasic.refresh();
        } else {
          pagingControllerBasic.appendLastPage(response.data!.data!);
        }

        var oldData = listRiderCheckpointBasicState.value.dataSuccess() ?? [];
        var newData = oldData + (response.data?.data ?? []);
        listRiderCheckpointBasicState.value = UIState.success(data: newData);
      } else {
        pagingControllerBasic.appendLastPage([]);
        listRiderCheckpointBasicState.value = UIState.error(
          message: response.message ?? 'Failed to fetch rider checkpoint data.',
        );
      }
    } catch (e) {
      pagingControllerBasic.appendLastPage([]);
      listRiderCheckpointBasicState.value =
          UIState.error(message: e.toString());
    }
  }

  Future<void> getRiderCheckpointTest({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 1,
    // DateTime? date,
  }) async {
    if (isRefresh) {
      listRiderCheckpointTestState.value = const UIState.loading();
      pagingControllerTest.refresh();
    }
    try {
      final response = await _checkpointRepository.getListRiderCheckpoint(
        page: pageKey,
        limit: _pageSize,
        kategori: RidersCheckpointKategori.hasilTest,
        // date: date,
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        if (isRefresh) {
          pagingControllerTest.refresh();
        } else {
          pagingControllerTest.appendLastPage(response.data!.data!);
        }

        var oldData = listRiderCheckpointTestState.value.dataSuccess() ?? [];
        var newData = oldData + (response.data?.data ?? []);
        listRiderCheckpointTestState.value = UIState.success(data: newData);
      } else {
        pagingControllerTest.appendLastPage([]);
        listRiderCheckpointTestState.value = UIState.error(
          message: response.message ?? 'Failed to fetch rider checkpoint data.',
        );
      }
    } catch (e) {
      pagingControllerTest.appendLastPage([]);
      listRiderCheckpointTestState.value = UIState.error(message: e.toString());
    }
  }

  // void previousMonth() {
  //   selectedDate = DateTime(selectedDate.year, selectedDate.month - 1, 1);
  //   getRiderCheckpointTest(isRefresh: true, date: selectedDate);
  //   update();
  // }

  // void nextMonth() {
  //   selectedDate = DateTime(selectedDate.year, selectedDate.month + 1, 1);
  //   getRiderCheckpointTest(isRefresh: true, date: selectedDate);
  //   update();
  // }
}
