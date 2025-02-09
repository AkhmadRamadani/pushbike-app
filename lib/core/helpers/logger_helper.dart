import 'dart:developer';

import 'package:flutter/foundation.dart';

class LoggerHelper {
  static void printMessage(String message, {String? tag, StackTrace? stackTrace}) {
    if (kDebugMode) {
      log(message, name: tag ?? 'LoggerHelper');
      if (stackTrace != null) {
        log(stackTrace.toString(), name: tag ?? 'LoggerHelper');
      }
    }
  }
}
