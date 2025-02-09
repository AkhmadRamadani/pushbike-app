import 'package:pushbike_app/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogContentGeneralWidget extends StatelessWidget {
  final VoidCallback? onTapPositiveButton;
  final VoidCallback? onTapNegativeButton;
  final String description;
  final String title;
  final String textPositiveButton;
  final String textNegativeButton;
  final String imagePath;
  final bool barrierDismissible;
  final String type;
  final bool isHorizontal;
  final Color? descColors;

  const DialogContentGeneralWidget.oneButton({
    super.key,
    required this.imagePath,
    required this.description,
    required this.title,
    this.onTapPositiveButton,
    required this.textPositiveButton,
    required this.barrierDismissible,
    this.descColors,
  })  : type = 'one-button',
        isHorizontal = true,
        textNegativeButton = '',
        onTapNegativeButton = null;

  const DialogContentGeneralWidget.twoButton({
    super.key,
    required this.imagePath,
    required this.description,
    required this.title,
    this.onTapPositiveButton,
    this.onTapNegativeButton,
    required this.textPositiveButton,
    required this.textNegativeButton,
    required this.barrierDismissible,
    this.isHorizontal = true,
    this.descColors,
  }) : type = 'two-button';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: Column(
        children: [
          Visibility(
            visible: imagePath.isNotEmpty,
            child: Image.asset(
              imagePath,
              height: 128.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Visibility(
            visible: title.isNotEmpty,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Visibility(
            visible: description.isNotEmpty,
            child: Builder(builder: (_) {
              final leng = description.split(" ").length;

              return Text(
                description,
                style: TextStyle(
                  fontSize: leng >= 20 ? 14.sp : 16.sp,
                  color: descColors ?? Colors.black87,
                ),
                textAlign: TextAlign.center,
              );
            }),
          ),
          SizedBox(
            height: 12.h,
          ),
          Visibility(
            visible: type == 'two-button',
            replacement: GestureDetector(
              onTap: onTapPositiveButton,
              child: Container(
                width: 1.sw,
                height: 48,
                decoration: BoxDecoration(
                  color: ColorConst.blue50,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Text(
                    textPositiveButton,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            child: isHorizontal
                ? Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onTapPositiveButton,
                          child: Container(
                            width: 1.sw,
                            height: 48,
                            decoration: BoxDecoration(
                              color: ColorConst.blue50,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: Center(
                              child: Text(
                                textPositiveButton,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onTapNegativeButton,
                          child: Container(
                            width: 1.sw,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                color: ColorConst.blue50,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                textNegativeButton,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.blue50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      GestureDetector(
                        onTap: onTapPositiveButton,
                        child: Container(
                          width: 1.sw,
                          height: 48,
                          decoration: BoxDecoration(
                            color: ColorConst.blue50,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Center(
                            child: Text(
                              textPositiveButton,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      GestureDetector(
                        onTap: onTapNegativeButton,
                        child: Container(
                          width: 1.sw,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(
                              color: ColorConst.blue50,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              textNegativeButton,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorConst.blue50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
