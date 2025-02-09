import 'package:get/get.dart';
import 'package:pushbike_app/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:pushbike_app/modules/event/controllers/event.controller.dart';
import 'package:pushbike_app/modules/home_page/controllers/home_page.controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.put(DashboardController());
    Get.put(EventController());
  }
}
