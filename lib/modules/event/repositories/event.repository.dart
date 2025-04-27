import 'package:dio/dio.dart';
import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/event/models/responses/detail_event.response.model.dart';
import 'package:pushbike_app/modules/event/models/responses/join_event.response.model.dart';
import 'package:pushbike_app/modules/event/models/responses/list_event.response.model.dart';

enum EventCategory { all, internal, external }

extension EventCategoryExtension on EventCategory {
  String get value {
    switch (this) {
      case EventCategory.all:
        return 'all';
      case EventCategory.internal:
        return 'internal';
      case EventCategory.external:
        return 'eksternal';
    }
  }
}

class EventRepository extends BaseRepository {
  Future<ResponseModelAbstraction<PaginationAbstraction<DatumEvent>>>
      getListEvent({
    EventCategory category = EventCategory.all,
    int page = 1,
    int limit = 5,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<PaginationAbstraction<DatumEvent>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.indexEventMobile,
        queryParameters: {
          'rider_id': localUserData?.selectedRider?.riderId,
          if (category != EventCategory.all) 'kategori': category.value,
          'page': page,
          'limit': limit,
          if (startDate != null) 'start_date': startDate.toDateString(),
          if (endDate != null) 'end_date': endDate.toDateString(),
        },
      ),
      fromJson: (data) => PaginationAbstraction<DatumEvent>.fromJson(
        data['data'],
        (json) => DatumEvent.fromJson(json),
      ),
      tag: 'EventRepository - getListEvent',
    );
  }

  Future<ResponseModelAbstraction<DetailEventResponseModel>> getDetailEvent({
    int eventId = 0,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();

    return makeRequest<DetailEventResponseModel>(
      apiCall: () => ApiServices.call().get(
        ApiConst.detailEventMobile(eventId),
        queryParameters: {
          'rider_id': localUserData?.selectedRider?.riderId,
        },
      ),
      fromJson: (data) => DetailEventResponseModel.fromJson(data),
      tag: 'EventRepository - getDetailEvent',
    );
  }

  Future<ResponseModelAbstraction<JoinEventResponseModel>> joinEvent({
    int eventId = 0,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    FormData formData = FormData.fromMap({
      'rider_id': localUserData?.selectedRider?.riderId,
      'event_id': eventId
    });
    return makeRequest<JoinEventResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.registerEventMobile,
        data: formData,
      ),
      fromJson: (data) => JoinEventResponseModel.fromJson(data),
      tag: 'EventRepository - joinEvent',
    );
  }
}
