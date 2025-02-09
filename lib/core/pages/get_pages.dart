import 'package:get/get.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/modules/authentication/features/on_board/views/on_board.view.dart';
import 'package:pushbike_app/modules/forgot_password/bindings/forgot_password_binding.dart';
import 'package:pushbike_app/modules/forgot_password/views/forgot_password.view.dart';
import 'package:pushbike_app/modules/home_page/bindings/home_page.binding.dart';
import 'package:pushbike_app/modules/home_page/views/home_page.view.dart';
import 'package:pushbike_app/modules/information/views/information_detail.view.dart';
import 'package:pushbike_app/modules/information/views/information.view.dart';
import 'package:pushbike_app/modules/jadwal/controllers/jadwal.controller.dart';
import 'package:pushbike_app/modules/jadwal/views/jadwal.view.dart';
import 'package:pushbike_app/modules/level/controllers/level.controller.dart';
import 'package:pushbike_app/modules/level/views/level.view.dart';
import 'package:pushbike_app/modules/authentication/features/login/controllers/login.controller.dart';
import 'package:pushbike_app/modules/authentication/features/login/views/login.view.dart';
import 'package:pushbike_app/modules/pembayaran/controllers/pembayaran.controller.dart';
import 'package:pushbike_app/modules/pembayaran/views/detail_pembayaran.view.dart';
import 'package:pushbike_app/modules/pembayaran/views/pembayaran.view.dart';
import 'package:pushbike_app/modules/pembayaran/views/pembayaran_pay.view.dart';
import 'package:pushbike_app/modules/pembayaran/views/riwayat_pembayaran.view.dart';
import 'package:pushbike_app/modules/point/views/point.view.dart';
import 'package:pushbike_app/modules/splash/controllers/splash.controller.dart';
import 'package:pushbike_app/modules/splash/views/splash.view.dart';

class GetPages {
  GetPages._();

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: AppRoutes.splash,
        page: () => const SplashView(),
        binding: BindingsBuilder(
          () {
            Get.put(() => SplashController());
          },
        ),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginView(),
        binding: BindingsBuilder(
          () {
            Get.put(() => LoginController());
          },
        ),
      ),
      //
      GetPage(
        name: AppRoutes.onBoard,
        page: () => const OnBoardView(),
      ),
      GetPage(
        name: AppRoutes.forgotPassword,
        page: () => const ForgotPasswordView(),
        binding: ForgotPasswordBinding(),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomePageView(),
        binding: HomePageBinding(),
      ),
      GetPage(
        name: AppRoutes.level,
        page: () => const LevelView(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut(() => LevelController());
          },
        ),
      ),
      GetPage(
        name: AppRoutes.point,
        page: () => const PointView(),
      ),
      GetPage(
        name: AppRoutes.information,
        page: () => const InformationView(),
      ),
      GetPage(
        name: AppRoutes.informationDetail,
        page: () => const InformationDetailView(),
      ),
      GetPage(
        name: AppRoutes.pembayaran,
        page: () => const PembayaranView(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut(() => PembayaranController());
          },
        ),
      ),
      GetPage(
        name: AppRoutes.pembayaranDetail,
        page: () => const DetailPembayaranView(),
      ),
      GetPage(
        name: AppRoutes.pembayaranRiwayat,
        page: () => const RiwayatPembayaranView(),
      ),
      GetPage(
        name: AppRoutes.pembayaranPay,
        page: () => const PembayaranPayView(),
      ),
      GetPage(
        name: AppRoutes.jadwal,
        page: () => const JadwalView(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut(() => JadwalController());
          },
        ),
      ),
    ];
  }
}
