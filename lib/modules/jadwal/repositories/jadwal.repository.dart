import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_ujian_data.respoonse.model.dart';

class JadwalRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetCalendarEventResponseModel>>
      getCalendarEvent({required DateTime date}) async {
    return makeRequest<GetCalendarEventResponseModel>(
      apiCall: () => ApiServices.call().get(ApiConst.calendarEvent,
          queryParameters: {'month': date.month, 'year': date.year}),
      fromJson: (data) => GetCalendarEventResponseModel.fromJson(data),
      tag: 'JadwalRepository - getCalendarEvent',
    );
  }

  Future<ResponseModelAbstraction<GetUjianDataResponseModel>>
      getUjianData() async {
    return makeRequest<GetUjianDataResponseModel>(
      apiCall: () => ApiServices.call().get(ApiConst.jadwalUjian),
      fromJson: (data) => GetUjianDataResponseModel.fromJson(data),
      tag: 'JadwalRepository - getCalendarEvent',
    );
  }
}
