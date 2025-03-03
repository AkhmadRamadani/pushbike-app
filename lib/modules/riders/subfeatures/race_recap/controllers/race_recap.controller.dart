import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/index_hasil_race.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/race_recap_rider.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/repositories/race_recap.repository.dart';

class RaceRecapController extends GetxController {
  static RaceRecapController get to => Get.find();

  Rx<UIState<List<DatumHasilEvent>>> listHasilEvent =
      const UIState<List<DatumHasilEvent>>.idle().obs;
  Rx<UIState<DataRaceRecapRider>> dataRaceRecapRider =
      const UIState<DataRaceRecapRider>.idle().obs;

  final RaceRecapRepository _raceRecapRepository = RaceRecapRepository();

  static const _pageSize = 10;

  final PagingController<int, DatumHasilEvent> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    getIndexHasilEvent(isRefresh: true);
    getDataRaceRecapRider();
    pagingController.addPageRequestListener((pageKey) {
      getIndexHasilEvent(pageKey: pageKey);
    });
  }

  Future<void> getIndexHasilEvent({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 0,
  }) async {
    if (isRefresh) {
      listHasilEvent.value = const UIState.loading();
      pagingController.refresh();
    }

    try {
      final response = await _raceRecapRepository.getIndexHasilEvent(
        page: pageKey,
        limit: _pageSize,
      );

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        final isLastPage =
            response.data!.currentPage == response.data!.lastPage;
        if (isLastPage) {
          pagingController.appendLastPage(response.data!.data!);
        } else {
          pagingController.appendPage(
              response.data!.data!, (response.data!.currentPage ?? 0) + 1);
        }

        var oldData = listHasilEvent.value.dataSuccess() ?? [];
        var newData = oldData + (response.data?.data ?? []);

        listHasilEvent.value = UIState.success(
          data: newData,
        );
      } else {
        pagingController.appendLastPage([]);
        listHasilEvent.value = UIState.error(
          message: response.message ?? 'Failed to fetch index hasil event.',
        );
      }
    } catch (e) {
      pagingController.appendLastPage([]);
      listHasilEvent.value = UIState.error(message: e.toString());
    }
  }

  Future<void> getDataRaceRecapRider() async {
    try {
      dataRaceRecapRider.value = const UIState.loading();
      final response =
          await _raceRecapRepository.getDataRaceRecapRider(DateTime.now());
      if (response.statusCode == 200) {
        dataRaceRecapRider.value =
            UIState.success(data: response.data?.data ?? DataRaceRecapRider());
      } else {
        dataRaceRecapRider.value = UIState.error(
            message: response.message ?? 'Failed to fetch race recap rider.');
      }
    } catch (e) {
      dataRaceRecapRider.value = UIState.error(message: e.toString());
    }
  }
}
