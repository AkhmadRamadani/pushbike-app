import 'package:pushbike_app/core/constants/asset_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class DialogContentLoadingWidget extends StatelessWidget {
  final bool barrierDismissible;
  const DialogContentLoadingWidget({
    super.key,
    required this.barrierDismissible,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: Center(
        child: SingleChildScrollView(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(60),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                    child: Lottie.asset(
                      AssetConst.loadingAnimation,
                      repeat: true,
                      reverse: false,
                      animate: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Loading ...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
