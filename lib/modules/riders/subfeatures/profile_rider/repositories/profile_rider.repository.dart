import 'package:dio/dio.dart';
import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/responses/get_initial_data.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/responses/update_rider.response.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/rider_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/sepeda_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/wali_data_update.model.dart';

class ProfileRiderRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetInitialDataProfileResponseModel>>
      getInitialData() async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<GetInitialDataProfileResponseModel>(
      apiCall: () => ApiServices.call().get(
        ApiConst.dataInitial(
          localUserData?.selectedRider?.riderId ?? 0,
        ),
      ),
      fromJson: (data) => GetInitialDataProfileResponseModel.fromJson(data),
      tag: 'ProfileRiderRepository - getInitialData',
    );
  }

  Future<ResponseModelAbstraction<UpdateRiderResponseModel>> updateRider({
    required RiderDataUpdateModel oldData,
    required RiderDataUpdateModel newData,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    var diff = oldData.compare(newData);
    if (diff.isEmpty) {
      return ResponseModelAbstraction<UpdateRiderResponseModel>(
        statusCode: 200,
        data: UpdateRiderResponseModel(
          message: 'Tidak ada perubahan',
        ),
      );
    }
    FormData formData = FormData.fromMap(diff);
    return makeRequest<UpdateRiderResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.updateRiderMobile(localUserData!.selectedRider!.riderId ?? 0),
        data: formData,
      ),
      fromJson: (data) => UpdateRiderResponseModel.fromJson(data),
      tag: 'ProfileRiderRepository - updateRider',
    );
  }

  Future<ResponseModelAbstraction<UpdateRiderResponseModel>> updateSepeda({
    required SepedaDataUpdateModel oldData,
    required SepedaDataUpdateModel newData,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    var diff = oldData.compare(newData);
    if (diff.isEmpty) {
      return ResponseModelAbstraction<UpdateRiderResponseModel>(
        statusCode: 200,
        data: UpdateRiderResponseModel(
          message: 'Tidak ada perubahan',
        ),
      );
    }
    FormData formData = FormData.fromMap(diff);
    return makeRequest<UpdateRiderResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.updateSepedaMobile(localUserData!.selectedRider!.riderId ?? 0),
        data: formData,
      ),
      fromJson: (data) => UpdateRiderResponseModel.fromJson(data),
      tag: 'ProfileRiderRepository - updateSepeda',
    );
  }

  Future<ResponseModelAbstraction<UpdateRiderResponseModel>> updateWali({
    required WaliDataUpdateModel oldData,
    required WaliDataUpdateModel newData,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    var diff = oldData.compare(newData);
    if (diff.isEmpty) {
      return ResponseModelAbstraction<UpdateRiderResponseModel>(
        statusCode: 200,
        data: UpdateRiderResponseModel(
          message: 'Tidak ada perubahan',
        ),
      );
    }
    FormData formData = FormData.fromMap(diff);
    return makeRequest<UpdateRiderResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.updateWaliMobile(localUserData!.wali?.waliId ?? 0),
        data: formData,
      ),
      fromJson: (data) => UpdateRiderResponseModel.fromJson(data),
      tag: 'ProfileRiderRepository - updateWali',
    );
  }
}
