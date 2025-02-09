import 'package:device_info_plus/device_info_plus.dart';
import 'package:pushbike_app/core/constants/app_const.dart';
import 'package:get/get.dart';

class DeviceVersionService {
  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      AppConst.androidVersion = androidInfo.version.sdkInt;
      AppConst().androidInfo = androidInfo;
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      AppConst().iosInfo = iosInfo;
    }
  }
}
