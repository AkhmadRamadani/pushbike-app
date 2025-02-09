import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/level/models/responses/get_my_level.response.model.dart';

class LevelRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetMyLevelResponseModel>> getMyLevel() async {
    return makeRequest<GetMyLevelResponseModel>(
      apiCall: () => ApiServices.call().get(ApiConst.myLevel),
      fromJson: (data) => GetMyLevelResponseModel.fromJson(data),
      tag: 'LevelRepository - getMyLevel',
    );
  }
}
