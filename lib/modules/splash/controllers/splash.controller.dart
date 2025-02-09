import 'package:get/get.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final localUserData = await LocalDbService.getUserLocalData();
    if ((localUserData?.token ?? "").isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.home);
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
