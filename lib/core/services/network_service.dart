import 'package:dio/dio.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:get/get.dart' as getx;
import 'package:pushbike_app/core/services/local_db.service.dart';

class ApiServices {
  ApiServices._();

  static ApiServices? _instance;

  Dio _dioCall({String? customToken}) {
    Dio dio = Dio();
    dio.options.baseUrl = ApiConst.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    // Use the custom token if provided, otherwise use the local token
    final token = customToken ?? LocalDbService.getUserToken();
    if (token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    dio.interceptors.add(LoggedOutInterceptor());
    return dio;
  }

  static Dio call({String? customToken}) {
    _instance ??= ApiServices._();
    return _instance!._dioCall(customToken: customToken);
  }
}

class LoggedOutInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      if ('${err.response?.data['message']}'.toLowerCase() ==
          'unauthenticated') {
        if (getx.Get.isDialogOpen ?? false) {
          return;
        }
        DialogService.showDialogProblem(
          title: 'Sesi Anda telah berakhir',
          description: 'Silakan login kembali',
          buttonOnTap: () async {
            await LocalDbService.clearLocalData();
            getx.Get.offAllNamed(AppRoutes.login);
          },
          barrierDismissible: false,
        );
      }
    }
    super.onError(err, handler);
  }
}
