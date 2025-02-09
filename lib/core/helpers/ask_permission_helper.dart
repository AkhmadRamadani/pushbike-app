import 'package:pushbike_app/core/constants/app_const.dart';
import 'package:pushbike_app/core/pages/permission_denied_page.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AskPermissionHelper {
  AskPermissionHelper._();

  static void camera({
    required Function() onGranted,
  }) async {
    var resCamera = await Permission.camera.request();
    if (resCamera.isPermanentlyDenied) {
      Get.to(() => const PermissionDeniedPage.camera());
      return;
    }
    if (!resCamera.isGranted) {
      camera(onGranted: onGranted);
      return;
    }

    onGranted();
  }

  static void contact({
    required Function() onGranted,
  }) async {
    var resContact = await Permission.contacts.request();
    if (resContact.isPermanentlyDenied) {
      Get.to(() => const PermissionDeniedPage.contact());
      return;
    }
    if (!resContact.isGranted) {
      contact(onGranted: onGranted);
      return;
    }
    onGranted();
  }

  static void notif({
    required Function() onGranted,
  }) async {
    var resNotif = await Permission.notification.request();
    if (resNotif.isPermanentlyDenied) {
      openAppSettings();
      return;
    }
    if (!resNotif.isGranted) {
      notif(onGranted: onGranted);
      return;
    }
    onGranted();
  }

  static void media({
    required Function() onGranted,
  }) async {
    var resMedia = await Permission.contacts.request();
    if (resMedia.isPermanentlyDenied) {
      Get.to(() => const PermissionDeniedPage.media());
      return;
    }
    if (!resMedia.isGranted) {
      camera(onGranted: onGranted);
      return;
    }
    onGranted();
  }

  static Future<T?> location<T>({
    required Function() onGranted,
  }) async {
    var resLocation = await Permission.location.request();
    if (resLocation.isPermanentlyDenied) {
      Get.to(() => const PermissionDeniedPage.location());
      return null;
    }
    if (!resLocation.isGranted) {
      camera(onGranted: onGranted);
      return null;
    }
    return onGranted();
  }

  static Future<T?> storage<T>({
    required Function() onGranted,
  }) async {
    PermissionStatus status;

    if (GetPlatform.isAndroid) {
      if ((AppConst.androidVersion ?? 0) > 32) {
        status = PermissionStatus.granted;
      } else {
        status = await Permission.storage.request();
      }
    } else {
      status = await Permission.storage.request();
    }

    if (status == PermissionStatus.permanentlyDenied) {
      Get.to(() => const PermissionDeniedPage.media());
      return null;
    }
    if (!status.isGranted) {
      storage(onGranted: onGranted);
      return null;
    }

    return onGranted();
  }
}
