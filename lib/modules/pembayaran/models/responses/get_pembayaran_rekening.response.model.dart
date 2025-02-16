// To parse this JSON data, do
//
//     final getPembayaranRekeningResponseModel = getPembayaranRekeningResponseModelFromJson(jsonString);

import 'dart:convert';

GetPembayaranRekeningResponseModel getPembayaranRekeningResponseModelFromJson(
        String str) =>
    GetPembayaranRekeningResponseModel.fromJson(json.decode(str));

String getPembayaranRekeningResponseModelToJson(
        GetPembayaranRekeningResponseModel data) =>
    json.encode(data.toJson());

class GetPembayaranRekeningResponseModel {
  DataRekening? data;

  GetPembayaranRekeningResponseModel({
    this.data,
  });

  GetPembayaranRekeningResponseModel copyWith({
    DataRekening? data,
  }) =>
      GetPembayaranRekeningResponseModel(
        data: data ?? this.data,
      );

  factory GetPembayaranRekeningResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetPembayaranRekeningResponseModel(
        data: json["data"] == null ? null : DataRekening.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class DataRekening {
  int? id;
  String? namaPembayaran;
  String? kategoriBank;
  String? nama;
  String? nomorRekening;
  String? uploadQris;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataRekening({
    this.id,
    this.namaPembayaran,
    this.kategoriBank,
    this.nama,
    this.nomorRekening,
    this.uploadQris,
    this.createdAt,
    this.updatedAt,
  });

  DataRekening copyWith({
    int? id,
    String? namaPembayaran,
    String? kategoriBank,
    String? nama,
    String? nomorRekening,
    String? uploadQris,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DataRekening(
        id: id ?? this.id,
        namaPembayaran: namaPembayaran ?? this.namaPembayaran,
        kategoriBank: kategoriBank ?? this.kategoriBank,
        nama: nama ?? this.nama,
        nomorRekening: nomorRekening ?? this.nomorRekening,
        uploadQris: uploadQris ?? this.uploadQris,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DataRekening.fromJson(Map<String, dynamic> json) => DataRekening(
        id: json["id"],
        namaPembayaran: json["nama_pembayaran"],
        kategoriBank: json["kategori_bank"],
        nama: json["nama"],
        nomorRekening: json["nomor_rekening"],
        uploadQris: json["upload_qris"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_pembayaran": namaPembayaran,
        "kategori_bank": kategoriBank,
        "nama": nama,
        "nomor_rekening": nomorRekening,
        "upload_qris": uploadQris,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
