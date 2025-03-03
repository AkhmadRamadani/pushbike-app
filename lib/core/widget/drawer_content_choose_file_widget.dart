import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/core/services/file_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

enum SourceFileEnum {
  storage,
  gallery,
  camera,
}

class DrawerContentChooseFileWidget extends StatelessWidget {
  final List<SourceFileEnum> sourceFiles;
  final List<String> allowedExtensionForPickFromStorage;
  final String customImageName;
  final String customFileName;

  const DrawerContentChooseFileWidget({
    super.key,
    this.sourceFiles = const [
      SourceFileEnum.storage,
      SourceFileEnum.gallery,
    ],
    this.allowedExtensionForPickFromStorage = const [
      'pdf',
      'png',
      'jpg',
      'jpeg',
    ],
    this.customImageName = '',
    this.customFileName = '',
  });
  @override
  Widget build(BuildContext context) {
    Widget cardSourceFileWidget({
      Function()? onTap,
      required String title,
      required Widget icon,
    }) {
      return Container(
        height: 80.w,
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorConst.blue100,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorConst.blue100,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    List<Widget> generateCardSourceFileWidget() {
      List<Widget> result = [];
      for (int i = 0; i < sourceFiles.length; i++) {
        switch (sourceFiles[i]) {
          case SourceFileEnum.camera:
            result.add(
              Expanded(
                child: cardSourceFileWidget(
                  title: 'Camera',
                  icon: const Icon(
                    Icons.camera_alt,
                    color: ColorConst.blue100,
                  ),
                  onTap: () async {
                    DialogService.showLoading();
                    var resultFile = await FilePickerServices.selectImage(
                      source: ImageSource.camera,
                      customImageName: customImageName,
                    );
                    DialogService.closeLoading();
                    if (resultFile == null) {
                      Get.back();
                      return;
                    }
                    Get.back(result: resultFile);
                  },
                ),
              ),
            );
            break;
          case SourceFileEnum.storage:
            result.add(
              Expanded(
                child: cardSourceFileWidget(
                  title: 'File',
                  icon: const Icon(
                    Icons.file_present_rounded,
                    color: ColorConst.blue100,
                  ),
                  onTap: () async {
                    DialogService.showLoading();
                    var resultFile = await FilePickerServices.selectFile(
                      allowedExtension: allowedExtensionForPickFromStorage,
                      customFileName: customFileName,
                    );
                    DialogService.closeLoading();
                    if (resultFile == null) {
                      Get.back();
                      return;
                    }
                    Get.back(result: resultFile);
                  },
                ),
              ),
            );
            break;
          case SourceFileEnum.gallery:
            result.add(
              Expanded(
                child: cardSourceFileWidget(
                  title: 'Galeri',
                  icon: const Icon(
                    Icons.image,
                    color: ColorConst.blue100,
                  ),
                  onTap: () async {
                    DialogService.showLoading();
                    var resultFile = await FilePickerServices.selectImage(
                      source: ImageSource.gallery,
                      customImageName: customImageName,
                    );
                    DialogService.closeLoading();
                    if (resultFile == null) {
                      Get.back();
                      return;
                    }
                    Get.back(result: resultFile);
                  },
                ),
              ),
            );
            break;
        }
      }

      return result;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: generateCardSourceFileWidget(),
    );
  }
}
