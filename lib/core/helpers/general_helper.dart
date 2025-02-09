import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GeneralHelper {
  GeneralHelper._();

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: Text(
          'Text copied to clipboard'.tr,
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
        maxWidth: 230.w,
        borderRadius: 50.r,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
