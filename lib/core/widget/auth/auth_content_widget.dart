import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushbike_app/core/constants/asset_const.dart';

class AuthContentWidget extends StatelessWidget {
  const AuthContentWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Top Illustration
          Container(
            height: 0.4.sh,
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AssetConst.loginIlustration,
            ),
          ),
          // Login Form Container
          Container(
            height: 0.6.sh,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
