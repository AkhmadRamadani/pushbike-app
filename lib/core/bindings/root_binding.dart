import 'package:get/get.dart';
import 'package:pushbike_app/modules/splash/controllers/splash.controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
