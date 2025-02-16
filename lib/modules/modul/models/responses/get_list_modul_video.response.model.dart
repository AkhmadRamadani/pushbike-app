// To parse this JSON data, do
//
//     final getListModulVideoResponseModel = getListModulVideoResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/modul/models/responses/get_kategori_modul.response.model.dart';

GetListModulVideoResponseModel getListModulVideoResponseModelFromJson(
        String str) =>
    GetListModulVideoResponseModel.fromJson(json.decode(str));

String getListModulVideoResponseModelToJson(
        GetListModulVideoResponseModel data) =>
    json.encode(data.toJson());

class GetListModulVideoResponseModel {
  List<ListModulVideoDatum>? data;

  GetListModulVideoResponseModel({
    this.data,
  });

  GetListModulVideoResponseModel copyWith({
    List<ListModulVideoDatum>? data,
  }) =>
      GetListModulVideoResponseModel(
        data: data ?? this.data,
      );

  factory GetListModulVideoResponseModel.fromJson(Map<String, dynamic> json) =>
      GetListModulVideoResponseModel(
        data: json["data"] == null
            ? []
            : List<ListModulVideoDatum>.from(
                json["data"]!.map((x) => ListModulVideoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ListModulVideoDatum {
  int? id;
  String? judul;
  int? mKategoriId;
  String? linkYoutube;
  int? durasi;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? thumbnail;
  KategoriModulDatum? kategori;

  ListModulVideoDatum({
    this.id,
    this.judul,
    this.mKategoriId,
    this.linkYoutube,
    this.durasi,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
    this.kategori,
  });

  ListModulVideoDatum copyWith({
    int? id,
    String? judul,
    int? mKategoriId,
    String? linkYoutube,
    int? durasi,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? thumbnail,
    KategoriModulDatum? kategori,
  }) =>
      ListModulVideoDatum(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        mKategoriId: mKategoriId ?? this.mKategoriId,
        linkYoutube: linkYoutube ?? this.linkYoutube,
        durasi: durasi ?? this.durasi,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        thumbnail: thumbnail ?? this.thumbnail,
        kategori: kategori ?? this.kategori,
      );

  factory ListModulVideoDatum.fromJson(Map<String, dynamic> json) =>
      ListModulVideoDatum(
        id: json["id"],
        judul: json["judul"],
        mKategoriId: json["m_kategori_id"],
        linkYoutube: json["link_youtube"],
        durasi: json["durasi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
        thumbnail: json["thumbnail"],
        kategori: json["kategori"] == null
            ? null
            : KategoriModulDatum.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "m_kategori_id": mKategoriId,
        "link_youtube": linkYoutube,
        "durasi": durasi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "thumbnail": thumbnail,
        "kategori": kategori?.toJson(),
      };

  String formatDuration(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    int seconds = 0; // Default seconds to 0

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }
}
