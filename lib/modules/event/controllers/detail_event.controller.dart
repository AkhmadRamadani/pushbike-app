import 'dart:convert';

import 'package:get/get.dart';
import 'package:pushbike_app/core/routes/app_routes.dart';
import 'package:pushbike_app/core/services/dialog_service.dart';
import 'package:pushbike_app/modules/event/enums/status_kolektifitas.enum.event.dart';
import 'package:pushbike_app/modules/event/enums/status_registered.enum.event.dart';
import 'package:pushbike_app/modules/event/models/responses/detail_event.response.model.dart';
import 'package:pushbike_app/modules/event/repositories/event.repository.dart';

class DetailEventController extends GetxController {
  static DetailEventController get to => Get.find();
  DetailEventResponseModel? data;
  List<String> racePack = [];
  List<String> pesertaList = [];

  final EventRepository _eventRepository = EventRepository();

  int eventId = 0;

  bool isLoading = false;

  StatusRegisteredEnumEvent getStatusRegistered() {
    if (data?.data?.isRegistered ?? false) {
      switch (data?.data?.registrationStatus) {
        case 'pending':
          return StatusRegisteredEnumEvent.pending;
        case 'approved':
          return StatusRegisteredEnumEvent.approved;
        case 'rejected':
          return StatusRegisteredEnumEvent.rejected;
        default:
          return StatusRegisteredEnumEvent.notRegistered;
      }
    } else {
      return StatusRegisteredEnumEvent.notRegistered;
    }
  }

  StatusKolektifitasEnumEvent getStatusKolektifitas() {
    if (data?.data?.kategori == 'internal') {
      return StatusKolektifitasEnumEvent.internal;
    }
    if (data?.data?.isKolektif == 1) {
      return StatusKolektifitasEnumEvent.kolektif;
    } else {
      return StatusKolektifitasEnumEvent.mandiri;
    }
  }

  @override
  void onInit() {
    super.onInit();

    var args = Get.arguments;
    if (args != null) {
      eventId = args['eventId'] as int;
    } else {
      Get.back();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getDetailEvent(eventId: eventId);
  }

  Future<void> getDetailEvent({int eventId = 0}) async {
    try {
      DialogService.showLoading();
      isLoading = true;
      update();

      final response = await _eventRepository.getDetailEvent(eventId: eventId);
      DialogService.closeLoading();

      if (response.statusCode == 200) {
        isLoading = false;

        data = response.data;
        racePack = List<String>.from(jsonDecode(data?.data?.racePack ?? '[]'));
        for (Peserta element in data?.data?.peserta ?? []) {
          String name = element.rider?.namaLengkap ?? "-";
          String gender = element.rider?.gender == 1 ? "Girls" : "Boys";
          String year = element.rider?.tanggalLahir?.year.toString() ?? "-";

          String item = "$name ($gender, $year)";
          pesertaList.add(item);
        }
        update();
      } else {
        DialogService.showDialogProblem(
          title: 'Detail Event Gagal',
          description: response.message ?? 'Unknown error occurred.',
        );
        update();
      }
    } catch (e) {
      DialogService.closeLoading();
      DialogService.showDialogProblem(
        title: 'Detail Event Gagal',
        description: e.toString(),
      );
    }
  }

  Future<void> joinEvent() async {
    try {
      DialogService.showLoading();
      final response = await _eventRepository.joinEvent(eventId: eventId);
      DialogService.closeLoading();

      if (response.statusCode == 200) {
        if (response.data?.data?.nominal == 0) {
          await DialogService.showDialogSuccess(
            title: 'Berhasil Join Event',
            description:
                'Pendaftaran berhasil dilakukan, silakan tunggu admin untuk merespon',
          );
          Get.back();
        } else {
          await Get.offAndToNamed(
            AppRoutes.pembayaranPay,
            arguments: {
              'tipe': 'Event',
              'nominal': data?.data?.harga,
            },
          );
          await DialogService.showDialogSuccess(
            title: 'Berhasil Join Event',
            description: response.message ?? 'Unknown error occurred.',
          );
        }
      } else {
        DialogService.showDialogProblem(
          title: 'Detail Event Gagal',
          description: response.message ?? 'Unknown error occurred.',
        );
      }
    } catch (e) {
      DialogService.closeLoading();
      DialogService.showDialogProblem(
        title: 'Detail Event Gagal',
        description: e.toString(),
      );
    }
  }
}
