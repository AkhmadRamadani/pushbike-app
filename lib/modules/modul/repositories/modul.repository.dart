import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/modul/models/responses/get_kategori_modul.response.model.dart';
import 'package:pushbike_app/modules/modul/models/responses/get_list_modul_video.response.model.dart';

class ModulRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetKategoriModulResponseModel>>
      getModulKategori({String? token}) async {
    return makeRequest<GetKategoriModulResponseModel>(
      apiCall: () => ApiServices.call(
        customToken: token,
      ).get(ApiConst.kategoriMobile),
      fromJson: (data) => GetKategoriModulResponseModel.fromJson(data),
      tag: 'ModulRepository - getUserData',
    );
  }

  Future<ResponseModelAbstraction<PaginationAbstraction<ListModulVideoDatum>>>
      getListModulVideo({
    int page = 1,
    int limit = 5,
    String? keyword,
    int? kategori,
  }) async {
    return makeRequest<PaginationAbstraction<ListModulVideoDatum>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.modulLatihan,
        queryParameters: {
          'page': page,
          'limit': limit,
          'keyword': keyword,
          'm_kategori_id': kategori,
        },
      ),
      fromJson: (data) => PaginationAbstraction<ListModulVideoDatum>.fromJson(
        data['data'],
        (json) => ListModulVideoDatum.fromJson(json),
      ),
      tag: 'ModulRepository - getListModulVideo',
    );
  }
}
