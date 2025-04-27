import 'package:pushbike_app/core/abstraction/base_repository.abstraction.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';
import 'package:pushbike_app/core/constants/api_const.dart';
import 'package:pushbike_app/core/db/local_user_data.dart';
import 'package:pushbike_app/core/extensions/date_extensions.dart';
import 'package:pushbike_app/core/services/local_db.service.dart';
import 'package:pushbike_app/core/services/network_service.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_latest_bill.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_list_membership.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_pembayaran_rekening.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/post_pembayaran.response.model.dart';

class PembayaranRepository extends BaseRepository {
  Future<ResponseModelAbstraction<GetListMembershipResponseModel>>
      getMembershipList() async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<GetListMembershipResponseModel>(
      apiCall: () =>
          ApiServices.call().get(ApiConst.membership, queryParameters: {
        'rider_id': localUserData?.selectedRider?.riderId,
      }),
      fromJson: (data) => GetListMembershipResponseModel.fromJson(data),
      tag: 'PembayaranRepository - getMembershipList',
    );
  }

  Future<ResponseModelAbstraction<GetLatestBillResponseModel>> getLatestBill({
    required DateTime date,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<GetLatestBillResponseModel>(
      apiCall: () =>
          ApiServices.call().get(ApiConst.getLatestBill, queryParameters: {
        'rider_id': localUserData?.selectedRider?.riderId,
        'date': date.toDateString(),
      }),
      fromJson: (data) => GetLatestBillResponseModel.fromJson(data),
      tag: 'PembayaranRepository - getLatestBill',
    );
  }

  // GetPaymetHistoryResponseModel
  Future<ResponseModelAbstraction<PaginationAbstraction<PaymentHistoryDatum>>>
      getPaymentHistory({
    int page = 1,
    int limit = 5,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<PaginationAbstraction<PaymentHistoryDatum>>(
      apiCall: () => ApiServices.call().get(
        ApiConst.historyPembayaran,
        queryParameters: {
          'rider_id': localUserData?.selectedRider?.riderId,
          'page': page,
          'limit': limit
        },
      ),
      fromJson: (data) => PaginationAbstraction<PaymentHistoryDatum>.fromJson(
        data['data'],
        (json) => PaymentHistoryDatum.fromJson(json),
      ),
      tag: 'PembayaranRepository - getPaymentHistory',
    );
  }

  // GetPembayaranRekeningResponseModel
  Future<ResponseModelAbstraction<GetPembayaranRekeningResponseModel>>
      getPembayaranRekening({
    required String namaPembayaran,
  }) async {
    return makeRequest<GetPembayaranRekeningResponseModel>(
      apiCall: () => ApiServices.call().get(
        ApiConst.pembayaranIndex,
        queryParameters: {
          'nama_pembayaran': namaPembayaran,
        },
      ),
      fromJson: (data) => GetPembayaranRekeningResponseModel.fromJson(data),
      tag: 'PembayaranRepository - getPembayaranRekening',
    );
  }

  /// PostPembayaranResponseModel
  /// parameter:
  /// [kategori]: kategori pembayaran, enum: ['Iuran', 'Support', 'Event']
  /// return: PostPembayaranResponseModel
  Future<ResponseModelAbstraction<PostPembayaranResponseModel>> postPembayaran({
    required String kategori,
    num? nominal,
  }) async {
    LocalUserData? localUserData = await LocalDbService.getUserLocalData();
    return makeRequest<PostPembayaranResponseModel>(
      apiCall: () => ApiServices.call().post(
        ApiConst.bayarPembayaran,
        data: {
          'rider_id': localUserData?.selectedRider?.riderId,
          'kategori': kategori,
          if (nominal != null) 'nominal': nominal
        },
      ),
      fromJson: (data) => PostPembayaranResponseModel.fromJson(data),
      tag: 'PembayaranRepository - postPembayaran',
    );
  }
}
