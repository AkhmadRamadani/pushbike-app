import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';
import 'package:pushbike_app/core/state/ui_state_model/ui_state_model.dart';
import 'package:pushbike_app/modules/modul/models/responses/get_kategori_modul.response.model.dart';
import 'package:pushbike_app/modules/modul/models/responses/get_list_modul_video.response.model.dart';
import 'package:pushbike_app/modules/modul/repositories/modul.repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ModulController extends GetxController {
  static ModulController get to => Get.find();

  final ModulRepository _modulRepository = ModulRepository();

  Rx<UIState<List<KategoriModulDatum>>> kategoriModulState =
      const UIState<List<KategoriModulDatum>>.idle().obs;
  Rx<UIState<PaginationAbstraction<ListModulVideoDatum>>> listModulVideoState =
      const UIState<PaginationAbstraction<ListModulVideoDatum>>.idle().obs;
  static const _pageSize = 10;

  final PagingController<int, ListModulVideoDatum> pagingController =
      PagingController(firstPageKey: 0);

  late Rx<KategoriModulDatum> selectedKategoriModul;

  @override
  void onInit() {
    super.onInit();
    getModulKategori();
    getListModulVideo(isRefresh: true);
    pagingController.addPageRequestListener((pageKey) {
      getListModulVideo(
        pageKey: pageKey,
        isLoadMore: true,
        kategori: selectedKategoriModul.value,
      );
    });
  }

  Future<void> getModulKategori() async {
    kategoriModulState.value = const UIState.loading();
    try {
      final response = await _modulRepository.getModulKategori();
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        response.data!.data!
            .insert(0, KategoriModulDatum(id: null, nama: 'Semua'));
        kategoriModulState.value = UIState.success(data: response.data!.data!);
        if (response.data!.data!.isNotEmpty) {
          selectedKategoriModul = response.data!.data!.first.obs;
        }
      } else {
        kategoriModulState.value = UIState.error(
          message: response.message ?? 'Failed to fetch modul kategori.',
        );
      }
    } catch (e) {
      kategoriModulState.value = UIState.error(message: e.toString());
    }
  }

  Future<void> getListModulVideo({
    bool isLoadMore = false,
    bool isRefresh = false,
    int pageKey = 1,
    String? keyword,
    KategoriModulDatum? kategori,
  }) async {
    if (isRefresh) {
      listModulVideoState.value = const UIState.loading();
    }
    try {
      final response = await _modulRepository.getListModulVideo(
        page: pageKey,
        limit: _pageSize,
        keyword: keyword,
        kategori: kategori?.id,
      );
      if (response.statusCode == 200 &&
          response.data != null &&
          response.data!.data != null) {
        if (isRefresh) {
          pagingController.refresh();
        } else {
          pagingController.appendLastPage(response.data!.data!);
        }

        var oldData = listModulVideoState.value.dataSuccess()?.data ?? [];
        var newData = oldData + (response.data?.data ?? []);
        listModulVideoState.value = UIState.success(
            data: PaginationAbstraction(
          data: newData,
          currentPage: response.data!.currentPage,
          lastPage: response.data!.lastPage,
        ));
      } else {
        pagingController.appendLastPage([]);
        listModulVideoState.value = UIState.error(
          message: response.message ?? 'Failed to fetch modul video.',
        );
      }
    } catch (e) {
    pagingController.appendLastPage([]);
      listModulVideoState.value = UIState.error(message: e.toString());
    }
  }

  void setSelectedKategoriModul(KategoriModulDatum kategoriModul) {
    selectedKategoriModul.value = kategoriModul;
    getListModulVideo(isRefresh: true, kategori: kategoriModul);
  }

  void navigateToYoutube(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
