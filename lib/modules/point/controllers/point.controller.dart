import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/level/models/responses/rider_history_points.response.model.dart';
import 'package:pushbike_app/modules/level/repositories/level.repository.dart';

class PointController extends GetxController {
  static PointController get to => Get.find<PointController>();

  final LevelRepository _levelRepository = LevelRepository();

  Rx<UIState<PaginationAbstraction<DatumRiderHistoryPoint>>>
      listRiderHistoryPoints =
      const UIState<PaginationAbstraction<DatumRiderHistoryPoint>>.idle().obs;

  static const _pageSize = 10;

  final PagingController<int, DatumRiderHistoryPoint> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();

    getRiderHistoryPoints(isRefresh: true);
    pagingController.addPageRequestListener((pageKey) {
      getRiderHistoryPoints(pageKey: pageKey, isLoadMore: true);
    });
  }

  Future<void> getRiderHistoryPoints({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 1,
  }) async {
    if (isRefresh) {
      listRiderHistoryPoints.value = const UIState.loading();
      pagingController.refresh();
    }
    try {
      final response = await _levelRepository.getRiderHistoryPoints(
        page: pageKey,
        limit: _pageSize,
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        if (isRefresh) {
          pagingController.refresh();
        } else {
          pagingController.appendLastPage(response.data!.data!);
        }

        var oldData = listRiderHistoryPoints.value.dataSuccess()?.data ?? [];
        var newData = oldData + (response.data?.data ?? []);
        listRiderHistoryPoints.value = UIState.success(
            data: PaginationAbstraction(
          data: newData,
          currentPage: response.data!.currentPage,
          lastPage: response.data!.lastPage,
        ));

        if (newData.isEmpty) {
          listRiderHistoryPoints.value =
              const UIState.empty(message: "Data Riwayat Poin Kosong");
          pagingController.appendLastPage([]);
          return;
        }
      } else {
        pagingController.appendLastPage([]);
        listRiderHistoryPoints.value = UIState.error(
          message: response.message ?? 'Failed to fetch modul video.',
        );
      }
    } catch (e) {
      pagingController.appendLastPage([]);
      listRiderHistoryPoints.value = UIState.error(message: e.toString());
    }
  }
}
