import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/services/network_service.dart';
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
        return 'external';
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
    return makeRequest<PaginationAbstraction<DatumEvent>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.indexEventMobile,
        queryParameters: {
          if (category != EventCategory.all) 'category': category.value,
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
      tag: 'EventRepository - getRiderHistoryPoints',
    );
  }
}
