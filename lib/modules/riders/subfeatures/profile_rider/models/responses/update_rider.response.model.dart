// To parse this JSON data, do
//
//     final updateRiderResponseModel = updateRiderResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateRiderResponseModel updateRiderResponseModelFromJson(String str) =>
    UpdateRiderResponseModel.fromJson(json.decode(str));

String updateRiderResponseModelToJson(UpdateRiderResponseModel data) =>
    json.encode(data.toJson());

class UpdateRiderResponseModel {
  String? message;
  Data? data;

  UpdateRiderResponseModel({
    this.message,
    this.data,
  });

  UpdateRiderResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      UpdateRiderResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory UpdateRiderResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateRiderResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? waliId;
  String? namaLengkap;
  String? panggilan;
  String? julukan;
  DateTime? tanggalLahir;
  String? tahunLahir;
  String? domisili;
  int? tinggiBadan;
  int? panjangKaki;
  int? panjangLengan;
  int? lingkarKepala;
  String? ukuranSepatu;
  String? nomorPlat;
  String? warnaOfficial;
  String? fotoRider;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? gender;
  int? mMembershipId;
  String? fotoRiderUrl;

  Data({
    this.id,
    this.waliId,
    this.namaLengkap,
    this.panggilan,
    this.julukan,
    this.tanggalLahir,
    this.tahunLahir,
    this.domisili,
    this.tinggiBadan,
    this.panjangKaki,
    this.panjangLengan,
    this.lingkarKepala,
    this.ukuranSepatu,
    this.nomorPlat,
    this.warnaOfficial,
    this.fotoRider,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.mMembershipId,
    this.fotoRiderUrl,
  });

  Data copyWith({
    int? id,
    int? waliId,
    String? namaLengkap,
    String? panggilan,
    String? julukan,
    DateTime? tanggalLahir,
    String? tahunLahir,
    String? domisili,
    int? tinggiBadan,
    int? panjangKaki,
    int? panjangLengan,
    int? lingkarKepala,
    String? ukuranSepatu,
    String? nomorPlat,
    String? warnaOfficial,
    String? fotoRider,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? gender,
    int? mMembershipId,
    String? fotoRiderUrl,
  }) =>
      Data(
        id: id ?? this.id,
        waliId: waliId ?? this.waliId,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        panggilan: panggilan ?? this.panggilan,
        julukan: julukan ?? this.julukan,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        tahunLahir: tahunLahir ?? this.tahunLahir,
        domisili: domisili ?? this.domisili,
        tinggiBadan: tinggiBadan ?? this.tinggiBadan,
        panjangKaki: panjangKaki ?? this.panjangKaki,
        panjangLengan: panjangLengan ?? this.panjangLengan,
        lingkarKepala: lingkarKepala ?? this.lingkarKepala,
        ukuranSepatu: ukuranSepatu ?? this.ukuranSepatu,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        warnaOfficial: warnaOfficial ?? this.warnaOfficial,
        fotoRider: fotoRider ?? this.fotoRider,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        gender: gender ?? this.gender,
        mMembershipId: mMembershipId ?? this.mMembershipId,
        fotoRiderUrl: fotoRiderUrl ?? this.fotoRiderUrl,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        waliId: json["wali_id"],
        namaLengkap: json["nama_lengkap"],
        panggilan: json["panggilan"],
        julukan: json["julukan"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        tahunLahir: json["tahun_lahir"],
        domisili: json["domisili"],
        tinggiBadan: json["tinggi_badan"],
        panjangKaki: json["panjang_kaki"],
        panjangLengan: json["panjang_lengan"],
        lingkarKepala: json["lingkar_kepala"],
        ukuranSepatu: json["ukuran_sepatu"],
        nomorPlat: json["nomor_plat"],
        warnaOfficial: json["warna_official"],
        fotoRider: json["foto_rider"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        mMembershipId: json["m_membership_id"],
        fotoRiderUrl: json["foto_rider_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wali_id": waliId,
        "nama_lengkap": namaLengkap,
        "panggilan": panggilan,
        "julukan": julukan,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "tahun_lahir": tahunLahir,
        "domisili": domisili,
        "tinggi_badan": tinggiBadan,
        "panjang_kaki": panjangKaki,
        "panjang_lengan": panjangLengan,
        "lingkar_kepala": lingkarKepala,
        "ukuran_sepatu": ukuranSepatu,
        "nomor_plat": nomorPlat,
        "warna_official": warnaOfficial,
        "foto_rider": fotoRider,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "m_membership_id": mMembershipId,
        "foto_rider_url": fotoRiderUrl,
      };
}
