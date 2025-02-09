import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/authentication/features/login/models/responses/login.response.model.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

class AuthRepository extends BaseRepository {
  Future<ResponseModelAbstraction<UserDataResponseModel>> getUserData(
      {String? token}) async {
    return makeRequest<UserDataResponseModel>(
      apiCall: () => ApiServices.call(
        customToken: token,
      ).get(ApiConst.currentLoginUser),
      fromJson: (data) => UserDataResponseModel.fromJson(data),
      tag: 'AuthRepository - getUserData',
    );
  }

  Future<ResponseModelAbstraction<LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    return makeRequest<LoginResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.login,
        data: {
          'email': email,
          'password': password,
        },
      ),
      fromJson: (data) => LoginResponseModel.fromJson(data),
      tag: 'LoginRepository - login',
    );
  }
}
