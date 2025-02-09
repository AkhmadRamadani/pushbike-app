import 'package:get/get.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/information/models/responses/get_pengumuman_data.response.model.dart';
import 'package:pushbike_app/modules/information/repositories/information.repository.dart';

class InformationController extends GetxController {
  Rx<UIState<List<DatumPengumumanModel>>> pengumumanData =
      const UIState<List<DatumPengumumanModel>>.idle().obs;

  InformationRepository informationRepository = InformationRepository();

  @override
  void onInit() {
    super.onInit();
    getPengumumanData();
  }

  Future<void> getPengumumanData() async {
    pengumumanData.value = const UIState<List<DatumPengumumanModel>>.loading();
    try {
      final response = await informationRepository.getIndexInformation(
        page: 1,
        limit: 5,
      );
      if (response.statusCode == 200) {
        if ((response.data!.data ?? []).isEmpty) {
          pengumumanData.value = const UIState.empty(
            message: 'Data not found',
          );
        } else {
          pengumumanData.value =
              UIState.success(data: response.data!.data ?? []);
        }
      } else {
        pengumumanData.value = UIState.error(
          message: response.message ?? 'Data not found',
        );
      }
    } catch (e) {
      pengumumanData.value = UIState<List<DatumPengumumanModel>>.error(
        message: e.toString(),
      );
    }
  }
}
