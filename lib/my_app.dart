import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushbike_app/core/bindings/root_binding.dart';
import 'package:pushbike_app/core/pages/get_pages.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Pushbike App',
          debugShowCheckedModeBanner: false,
          initialBinding: RootBinding(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: AppRoutes.splash,
          getPages: GetPages.getPages(),
        );
      },
    );
  }
}
