import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/index_hasil_race.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/post_hasil_even.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/race_recap_rider.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/user_joined_event.response.model.dart';

class RaceRecapRepository extends BaseRepository {
  Future<ResponseModelAbstraction<UserJoinedEventResponseModel>>
      getRiderJoinedEvent() async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest(
      apiCall: () =>
          ApiServices.call().get(ApiConst.riderJoinedEvent, queryParameters: {
        'rider_id': localUserData?.selectedRider?.riderId,
      }),
      fromJson: (data) => UserJoinedEventResponseModel.fromJson(data),
      tag: 'RaceRecapRepository - getUserJoinedEvent',
    );
  }

  Future<ResponseModelAbstraction<PaginationAbstraction<DatumHasilEvent>>>
      getIndexHasilEvent({
    int page = 1,
    int limit = 10,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest(
      apiCall: () =>
          ApiServices.call().get(ApiConst.indexHasilRace, queryParameters: {
        'rider_id': localUserData?.selectedRider?.riderId,
        'page': page,
        'limit': limit,
      }),
      fromJson: (data) => PaginationAbstraction<DatumHasilEvent>.fromJson(
        data['data'],
        (json) => DatumHasilEvent.fromJson(json),
      ),
      tag: 'RaceRecapRepository - getUserJoinedEvent',
    );
  }

  Future<ResponseModelAbstraction<PostHasilEventResponseModel>> postHasilEvent({
    required int eventId,
    required String kategori,
    required String podium,
    required File foto,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    FormData formData = FormData.fromMap({
      'm_rider_id': localUserData?.selectedRider?.riderId,
      'm_event_id': eventId,
      'kategori': kategori,
      'podium': podium,
      'foto': await MultipartFile.fromFile(foto.path),
    });
    return makeRequest(
      apiCall: () => ApiServices.call().post(
        ApiConst.uploadHasilRace,
        data: formData,
      ),
      fromJson: (data) => PostHasilEventResponseModel.fromJson(data),
      tag: 'RaceRecapRepository - postHasilEvent',
    );
  }

  // getDataRaceRecapRider
  Future<ResponseModelAbstraction<RaceRecapRiderResponseModel>>
      getDataRaceRecapRider(DateTime date) async {
        LocalUserData? localUserData = await LocalDbService.getUserLocalData();
        return makeRequest(
          apiCall: () =>
              ApiServices.call().get(ApiConst.raceRecapRider, queryParameters: {
            'rider_id': localUserData?.selectedRider?.riderId,
            'date': date.toDateString(),
          }),
          fromJson: (data) => RaceRecapRiderResponseModel.fromJson(data),
          tag: 'RaceRecapRepository - getDataRaceRecapRider',
        );
      }
}
