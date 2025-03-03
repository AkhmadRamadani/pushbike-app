import 'dart:io';

import 'package:dio/dio.dart';

class WaliDataUpdateModel {
  int? id;
  int? userId;
  String? namaMama;
  String? telpMama;
  String? namaPapa;
  String? emailAkun;
  String? alamat;
  dynamic fotoProfile; // Bisa berupa URL (String) atau File
  dynamic fileKk; // Kartu Keluarga (URL atau File)
  dynamic fileAkte; // Akta Anak (URL atau File)
  dynamic fileKia; // KIA (URL atau File)

  WaliDataUpdateModel({
    this.id,
    this.userId,
    this.namaMama,
    this.telpMama,
    this.namaPapa,
    this.emailAkun,
    this.alamat,
    this.fotoProfile,
    this.fileKk,
    this.fileAkte,
    this.fileKia,
  });

  // Convert JSON to Model
  factory WaliDataUpdateModel.fromJson(Map<String, dynamic> json) {
    return WaliDataUpdateModel(
      id: json['id'],
      userId: json['user_id'],
      namaMama: json['nama_mama'],
      telpMama: json['telp_mama'],
      namaPapa: json['nama_papa'],
      emailAkun: json['email_akun'],
      alamat: json['alamat'],
      fotoProfile: json['foto_profile_url'], // Bisa URL atau File
      fileKk: json['file_kk_url'], // Bisa URL atau File
      fileAkte: json['file_akte_url'], // Bisa URL atau File
      fileKia: json['file_kia_url'], // Bisa URL atau File
    );
  }

  // Convert Model to JSON (untuk data biasa, tanpa file)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "nama_mama": namaMama,
      "telp_mama": telpMama,
      "nama_papa": namaPapa,
      "email_akun": emailAkun,
      "alamat": alamat,
    };
  }

  // Compare two objects and return a list of differences
  Map<String, dynamic> compare(WaliDataUpdateModel newData) {
    Map<String, dynamic> differences = {};

    if (namaMama != newData.namaMama) {
      differences['nama_mama'] = newData.namaMama;
    }
    if (telpMama != newData.telpMama) {
      differences['telp_mama'] = newData.telpMama;
    }
    if (namaPapa != newData.namaPapa) {
      differences['nama_papa'] = newData.namaPapa;
    }
    if (emailAkun != newData.emailAkun) {
      differences['email_akun'] = newData.emailAkun;
    }
    if (alamat != newData.alamat) differences['alamat'] = newData.alamat;

    // Cek apakah file baru adalah file, bukan hanya string URL
    if (newData.fotoProfile is File) {
      differences['foto_profile'] =
          MultipartFile.fromFileSync(newData.fotoProfile.path);
    }
    if (newData.fileKk is File) {
      differences['file_kk'] = MultipartFile.fromFileSync(newData.fileKk.path);
    }
    if (newData.fileAkte is File) {
      differences['file_akte'] =
          MultipartFile.fromFileSync(newData.fileAkte.path);
    }
    if (newData.fileKia is File) {
      differences['file_kia'] =
          MultipartFile.fromFileSync(newData.fileKia.path);
    }

    return differences;
  }
}
