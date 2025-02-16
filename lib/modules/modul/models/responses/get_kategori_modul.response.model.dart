// To parse this JSON data, do
//
//     final getKategoriModulResponseModel = getKategoriModulResponseModelFromJson(jsonString);

import 'dart:convert';

GetKategoriModulResponseModel getKategoriModulResponseModelFromJson(
        String str) =>
    GetKategoriModulResponseModel.fromJson(json.decode(str));

String getKategoriModulResponseModelToJson(
        GetKategoriModulResponseModel data) =>
    json.encode(data.toJson());

class GetKategoriModulResponseModel {
  List<KategoriModulDatum>? data;

  GetKategoriModulResponseModel({
    this.data,
  });

  GetKategoriModulResponseModel copyWith({
    List<KategoriModulDatum>? data,
  }) =>
      GetKategoriModulResponseModel(
        data: data ?? this.data,
      );

  factory GetKategoriModulResponseModel.fromJson(Map<String, dynamic> json) =>
      GetKategoriModulResponseModel(
        data: json["data"] == null
            ? []
            : List<KategoriModulDatum>.from(
                json["data"]!.map((x) => KategoriModulDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class KategoriModulDatum {
  int? id;
  String? nama;
  int? urutan;
  DateTime? createdAt;
  DateTime? updatedAt;

  KategoriModulDatum({
    this.id,
    this.nama,
    this.urutan,
    this.createdAt,
    this.updatedAt,
  });

  KategoriModulDatum copyWith({
    int? id,
    String? nama,
    int? urutan,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      KategoriModulDatum(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        urutan: urutan ?? this.urutan,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory KategoriModulDatum.fromJson(Map<String, dynamic> json) =>
      KategoriModulDatum(
        id: json["id"],
        nama: json["nama"],
        urutan: json["urutan"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "urutan": urutan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
