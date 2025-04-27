import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/information/models/responses/detail_pengumuman.response.model.dart';
import 'package:pushbike_app/modules/information/models/responses/get_pengumuman_data.response.model.dart';

class InformationRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetPengumumanDataResponseModel>>
      getIndexInformation({
    int? page,
    int? limit,
  }) async {
    LocalUserData? localData = await getLocalData();
    return makeRequest<GetPengumumanDataResponseModel>(
      apiCall: () => ApiServices.call().get(
          ApiConst.announcement(localData?.selectedRider?.riderId ?? 0),
          queryParameters: {'page': page, 'limit': limit}),
      fromJson: (data) => GetPengumumanDataResponseModel.fromJson(data['data']),
      tag: 'InformationRepository - getIndexInformation',
    );
  }

  Future<ResponseModelAbstraction<DetailPengumumanResponseModel>>
      postReadAnnouncement(int id) async {
    LocalUserData? localData = await getLocalData();
    return makeRequest(
      apiCall: () => ApiServices.call().post(ApiConst.announcementRead, data: {
        "m_pengumuman_id": id,
        "m_rider_id": localData?.selectedRider?.riderId,
        "is_read": true,
      }),
      fromJson: (data) => DetailPengumumanResponseModel.fromJson(data),
      tag: 'InformationRepository - postReadAnnouncement',
    );
  }
}
