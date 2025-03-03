import 'dart:io';

import 'package:dio/dio.dart';

class RiderDataUpdateModel {
  int? id;
  int? waliId;
  String? namaLengkap;
  String? panggilan;
  String? julukan;
  String? tanggalLahir;
  String? domisili;
  int? tinggiBadan;
  int? panjangKaki;
  int? panjangLengan;
  int? lingkarKepala;
  dynamic ukuranSepatu;
  String? nomorPlat;
  String? warnaOfficial;
  dynamic fotoRider; // Bisa berupa URL (String) atau File

  RiderDataUpdateModel({
    this.id,
    this.waliId,
    this.namaLengkap,
    this.panggilan,
    this.julukan,
    this.tanggalLahir,
    this.domisili,
    this.tinggiBadan,
    this.panjangKaki,
    this.panjangLengan,
    this.lingkarKepala,
    this.ukuranSepatu,
    this.nomorPlat,
    this.warnaOfficial,
    this.fotoRider,
  });

  // Convert JSON to Model
  factory RiderDataUpdateModel.fromJson(Map<String, dynamic> json) {
    return RiderDataUpdateModel(
      id: json['id'],
      waliId: json['wali_id'],
      namaLengkap: json['nama_lengkap'],
      panggilan: json['panggilan'],
      julukan: json['julukan'],
      tanggalLahir: json['tanggal_lahir'],
      domisili: json['domisili'],
      tinggiBadan: json['tinggi_badan'],
      panjangKaki: json['panjang_kaki'],
      panjangLengan: json['panjang_lengan'],
      lingkarKepala: json['lingkar_kepala'],
      ukuranSepatu: json['ukuran_sepatu'],
      nomorPlat: json['nomor_plat'],
      warnaOfficial: json['warna_official'],
      fotoRider: json['foto_rider_url'], // Bisa URL atau File
    );
  }

  // Convert Model to JSON (untuk data biasa)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "wali_id": waliId,
      "nama_lengkap": namaLengkap,
      "panggilan": panggilan,
      "julukan": julukan,
      "tanggal_lahir": tanggalLahir,
      "domisili": domisili,
      "tinggi_badan": tinggiBadan,
      "panjang_kaki": panjangKaki,
      "panjang_lengan": panjangLengan,
      "lingkar_kepala": lingkarKepala,
      "ukuran_sepatu": ukuranSepatu,
      "nomor_plat": nomorPlat,
      "warna_official": warnaOfficial,
    };
  }

  // Compare two objects and return a list of differences
  Map<String, dynamic> compare(RiderDataUpdateModel newData) {
    Map<String, dynamic> differences = {};

    if (namaLengkap != newData.namaLengkap) {
      differences['nama_lengkap'] = newData.namaLengkap;
    }
    if (panggilan != newData.panggilan) {
      differences['panggilan'] = newData.panggilan;
    }
    if (julukan != newData.julukan) differences['julukan'] = newData.julukan;
    if (tanggalLahir != newData.tanggalLahir) {
      differences['tanggal_lahir'] = newData.tanggalLahir;
    }
    if (domisili != newData.domisili) {
      differences['domisili'] = newData.domisili;
    }
    if (tinggiBadan != newData.tinggiBadan) {
      differences['tinggi_badan'] = newData.tinggiBadan;
    }
    if (panjangKaki != newData.panjangKaki) {
      differences['panjang_kaki'] = newData.panjangKaki;
    }
    if (panjangLengan != newData.panjangLengan) {
      differences['panjang_lengan'] = newData.panjangLengan;
    }
    if (lingkarKepala != newData.lingkarKepala) {
      differences['lingkar_kepala'] = newData.lingkarKepala;
    }
    if (ukuranSepatu != newData.ukuranSepatu) {
      differences['ukuran_sepatu'] = newData.ukuranSepatu;
    }
    if (nomorPlat != newData.nomorPlat) {
      differences['nomor_plat'] = newData.nomorPlat;
    }
    if (warnaOfficial != newData.warnaOfficial) {
      differences['warna_official'] = newData.warnaOfficial;
    }

    // Cek apakah foto baru adalah file, bukan hanya string URL
    if (newData.fotoRider is File) {
      differences['foto_rider'] = MultipartFile.fromFileSync(newData.fotoRider.path);
    }

    return differences;
  }
}
