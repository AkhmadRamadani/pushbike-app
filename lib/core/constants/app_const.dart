import 'package:device_info_plus/device_info_plus.dart';

class AppConst {
  // AppConst._();

  static const String appName = "Pushbike App";
  static const String appVersion = "1.0.0";
  static const String appDescription = "Pushbike Mobile App";

  static int? androidVersion;

  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
}
