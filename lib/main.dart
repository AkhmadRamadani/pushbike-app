import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pushbike_app/core/helpers/logger_helper.dart';
import 'package:pushbike_app/core/services/device_version_service.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/my_app.dart';

import 'package:timezone/data/latest.dart' as tz;

import 'package:intl/date_symbol_data_local.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // await Firebase.initializeApp(
      //   name: 'Doctor Mobile',
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );
      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      tz.initializeTimeZones();

      await DeviceVersionService().getDeviceInfo();
      await LocalDbService.initialize();

      await initializeDateFormatting('id_ID');

      return runApp(
        const MyApp(),
      );
    },
    (error, stackTrace) {
      LoggerHelper.printMessage(
          'runZonedGuarded: Caught error in my root zone.');
      LoggerHelper.printMessage(error.toString());
      LoggerHelper.printMessage(stackTrace.toString());
    },
  );
}
