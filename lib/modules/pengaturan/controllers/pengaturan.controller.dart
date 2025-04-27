import 'package:get/get.dart';
import 'package:pushbike_app/core/helpers/local_db.helper.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';

class PengaturanController extends GetxController {
  static PengaturanController get to => Get.find();

  void logout() {
    LocalDBHelper.clearLocalData();
    Get.offAllNamed(AppRoutes.login);
  }

  void dialog() {
    DialogService.showDialogChoice(
      title: 'Logout?',
      description: 'Apakah anda yakin ingin keluar dari akun ini?',
      onTapPositiveButton: () => logout(),
      onTapNegativeButton: () => Get.back(),
    );
  }
}
