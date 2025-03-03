import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/level/models/responses/get_my_level.response.model.dart';
import 'package:pushbike_app/modules/level/models/responses/rider_history_points.response.model.dart';

class LevelRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetMyLevelResponseModel>> getMyLevel() async {
    return makeRequest<GetMyLevelResponseModel>(
      apiCall: () => ApiServices.call().get(ApiConst.myLevel),
      fromJson: (data) => GetMyLevelResponseModel.fromJson(data),
      tag: 'LevelRepository - getMyLevel',
    );
  }

  Future<
          ResponseModelAbstraction<
              PaginationAbstraction<DatumRiderHistoryPoint>>>
      getRiderHistoryPoints({
    int page = 1,
    int limit = 5,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<PaginationAbstraction<DatumRiderHistoryPoint>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.riderHistoryPoint,
        queryParameters: {
          'rider_id': localUserData?.selectedRider?.riderId,
          'page': page,
          'limit': limit,
        },
      ),
      fromJson: (data) =>
          PaginationAbstraction<DatumRiderHistoryPoint>.fromJson(
        data['data'],
        (json) => DatumRiderHistoryPoint.fromJson(json),
      ),
      tag: 'LevelRepository - getRiderHistoryPoints',
    );
  }
}
