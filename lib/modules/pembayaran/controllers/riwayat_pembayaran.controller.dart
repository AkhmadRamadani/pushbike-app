import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/repositories/pembayaran.repository.dart';

class RiwayatPembayaranController extends GetxController {
  static RiwayatPembayaranController get to => Get.find();

  PembayaranRepository pembayaranRepository = PembayaranRepository();

  Rx<UIState<PaginationAbstraction<PaymentHistoryDatum>>> paymentHistoryState =
      const UIState<PaginationAbstraction<PaymentHistoryDatum>>.idle().obs;
  static const _pageSize = 10;

  final PagingController<int, PaymentHistoryDatum> pagingController =
      PagingController(firstPageKey: 0);
  @override
  void onInit() {
    super.onInit();
    getPaymentHistory(isRefresh: true);
    pagingController.addPageRequestListener((pageKey) {
      getPaymentHistory(pageKey: pageKey);
    });
  }

  Future<void> getPaymentHistory({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 0,
  }) async {
    if (isRefresh) {
      paymentHistoryState.value = const UIState.loading();
      pagingController.refresh();
    }

    try {
      final response = await pembayaranRepository.getPaymentHistory(
        page: pageKey,
        limit: _pageSize,
      );

      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        final isLastPage =
            response.data!.currentPage == response.data!.lastPage;
        if (isLastPage) {
          pagingController.appendLastPage(response.data!.data!);
        } else {
          pagingController.appendPage(
              response.data!.data!, (response.data!.currentPage ?? 0) + 1);
        }

        var oldData = paymentHistoryState.value.dataSuccess()?.data ?? [];
        var newData = oldData + (response.data?.data ?? []);

        paymentHistoryState.value = UIState.success(
          data: PaginationAbstraction<PaymentHistoryDatum>(
            currentPage: response.data!.currentPage,
            lastPage: response.data!.lastPage,
            data: newData,
          ),
        );
      } else {
        pagingController.appendLastPage([]);
        paymentHistoryState.value = UIState.error(
          message: response.message ?? 'Failed to fetch payment history.',
        );
      }
    } catch (e) {
      pagingController.appendLastPage([]);
      paymentHistoryState.value = UIState.error(message: e.toString());
    }
  }
}
