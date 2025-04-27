import 'package:get/get.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/extensions/num_extensions.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_pembayaran_rekening.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/repositories/pembayaran.repository.dart';
import 'package:url_launcher/url_launcher.dart';

class PembayaranPayController extends GetxController {
  static PembayaranPayController get to => Get.find();
  PembayaranRepository pembayaranRepository = PembayaranRepository();

  LocalUserData? localUserData;
  Rx<UIState<DataRekening>> dataRekening =
      const UIState<DataRekening>.idle().obs;

  String tipe = "";
  num? nominal;

  @override
  void onInit() {
    super.onInit();

    localUserData = LocalDbService.getUserLocalDataSync();

    var args = Get.arguments;
    if (args != null) {
      tipe = args['tipe'];
      nominal = args['nominal'];
      getDataRekening(namaPembayaran: tipe);
    }
  }

  Future<void> getDataRekening({
    required String namaPembayaran,
  }) async {
    dataRekening.value = const UIState.loading();
    try {
      final response = await pembayaranRepository.getPembayaranRekening(
          namaPembayaran: namaPembayaran);
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        dataRekening.value = UIState.success(data: response.data!.data!);
      } else {
        dataRekening.value = UIState.error(
          message: response.message ?? 'Failed to fetch data rekening.',
        );
      }
    } catch (e) {
      dataRekening.value = UIState.error(message: e.toString());
    }
  }

  void dialogAskPostPembayaran() {
    DialogService.showDialogChoice(
      description: "Pastikan Anda sudah melakukan pembayaran terlebih dahulu.",
      onTapPositiveButton: () => postPembayaran(),
      onTapNegativeButton: () => Get.back(),
    );
  }

  Future<void> postPembayaran() async {
    try {
      final response = await pembayaranRepository.postPembayaran(
        kategori: tipe,
        nominal: nominal,
      );
      if (response.statusCode == 200) {
        await toWhatsApp();
        Get.back();
        DialogService.showDialogSuccess(
          title: 'Pembayaran Berhasil',
          description:
              'Pembayaran berhasil dilakukan, silakan tunggu admin untuk merespon',
        );
      } else {
        DialogService.showDialogProblem(
          title: 'Pembayaran Gagal',
          description: response.message ?? 'Unknown error occurred.',
        );
      }
    } catch (e) {
      DialogService.showDialogProblem(
        title: 'Pembayaran Gagal',
        description: e.toString(),
      );
    }
  }

  Future toWhatsApp() async {
    var noWhatsapp = "https://wa.me/6281230832624";
    var message =
        "Hello, admin! Saya ingin mengonfirmasi pembayaran atas nama ${localUserData?.selectedRider?.namaLengkap ?? ""}, membership ${localUserData?.membership?.judulMember ?? ""} dengan nominal ${localUserData?.membership?.hargaNum.toRupiah() ?? ""}.";

    var url = "$noWhatsapp?text=$message";
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
