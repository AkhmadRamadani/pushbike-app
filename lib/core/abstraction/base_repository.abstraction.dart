import 'package:dio/dio.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/helpers/dio_error_helper.dart';
import 'package:pushbike_app/core/helpers/logger_helper.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';

abstract class BaseRepository {
  Future<LocalUserData?> getLocalData() async {
    try {
      final data = await LocalDbService.getUserLocalData();
      return data;
    } catch (err, stackTrace) {
      LoggerHelper.printMessage(
        'Error in getLocalData: $err',
        stackTrace: stackTrace,
        tag: 'BaseRepository - getLocalData',
      );
      return null;
    }
  }

  Future<ResponseModelAbstraction<T>> makeRequest<T>({
    required Future<Response> Function() apiCall,
    required T Function(Map<String, dynamic>) fromJson,
    required String tag,
  }) async {
    try {
      final res = await apiCall();

      final response = fromJson(res.data);


      return ResponseModelAbstraction<T>(
        statusCode: res.statusCode,
        message: res.statusMessage,
        data: response,
      );
    } on DioException catch (dioError) {
      final statusCode = dioError.response?.statusCode ?? 400;
      final errorMessage = DioErrorHelper.fromDioError(dioError);

      if (dioError.response?.data == null) {
        throw errorMessage;
      }

      try {
        final response = fromJson(dioError.response?.data ?? {});
        return ResponseModelAbstraction<T>(
          statusCode: statusCode,
          message: errorMessage,
          data: response,
        );
      } catch (_) {
        throw errorMessage;
      }
    } catch (err, stackTrace) {
      LoggerHelper.printMessage(
        'Error in $tag: $err',
        stackTrace: stackTrace,
        tag: tag,
      );
      throw 'Terjadi kesalahan saat menerima data, silahkan coba lagi.';
    }
  }
}
