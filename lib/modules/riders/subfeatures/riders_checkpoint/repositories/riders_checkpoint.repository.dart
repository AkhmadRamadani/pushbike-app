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
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/post_checkpoint.response.model.dart';

enum RidersCheckpointKategori { basic, hasilTest }

extension RidersCheckpointKategoriExtension on RidersCheckpointKategori {
  String get value {
    switch (this) {
      case RidersCheckpointKategori.basic:
        return 'basic';
      case RidersCheckpointKategori.hasilTest:
        return 'hasil test';
    }
  }
}

class RidersCheckpointRepository extends BaseRepository {
  Future<ResponseModelAbstraction<PaginationAbstraction<DatumRiderCheckpoint>>>
      getListRiderCheckpoint({
    int page = 1,
    int limit = 5,
    DateTime? date,
    RidersCheckpointKategori kategori = RidersCheckpointKategori.basic,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<PaginationAbstraction<DatumRiderCheckpoint>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.ridersCheckpointMobile,
        queryParameters: {
          if (date != null) 'bulan': date.toReadableMonth(),
          'kategori': kategori.value,
          'page': page,
          'limit': limit,
          'rider_id': localUserData?.selectedRider?.riderId,
        },
      ),
      fromJson: (data) => PaginationAbstraction<DatumRiderCheckpoint>.fromJson(
        data['data'],
        (json) => DatumRiderCheckpoint.fromJson(json),
      ),
      tag: 'RidersCheckpointRepository - getListRiderCheckpoint',
    );
  }

  Future<ResponseModelAbstraction<PostCheckpointResponseModel>> postCheckpoint({
    required int checkpointId,
    String? keterangan,
    int? waktu,
    File? image,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    FormData formData = FormData.fromMap({
      'rider_id': localUserData?.selectedRider?.riderId,
      'checkpoint_id': checkpointId,
      'keterangan': keterangan,
      'time': waktu,
      'bukti': await MultipartFile.fromFile(image!.path),
    });
    return makeRequest<PostCheckpointResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.assignCheckpoint,
        data: formData,
      ),
      fromJson: (data) => PostCheckpointResponseModel.fromJson(data),
      tag: 'RidersCheckpointRepository - postCheckpoint',
    );
  }
}
