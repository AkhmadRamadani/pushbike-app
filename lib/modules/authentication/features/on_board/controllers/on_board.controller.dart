import 'package:get/get.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';

class OnBoardController extends GetxController {
  final LocalUserData localUserData = LocalDbService.getUserLocalDataSync()!;

  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  Future<void> checkLogin() async {
    if ((localUserData.token ?? "").isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.home);
    }
  }
}
