// To parse this JSON data, do
//
//     final listEventResponseModel = listEventResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/core/extensions/date_extensions.dart';

ListEventResponseModel listEventResponseModelFromJson(String str) =>
    ListEventResponseModel.fromJson(json.decode(str));

String listEventResponseModelToJson(ListEventResponseModel data) =>
    json.encode(data.toJson());

class ListEventResponseModel {
  List<DatumEvent>? data;

  ListEventResponseModel({
    this.data,
  });

  ListEventResponseModel copyWith({
    List<DatumEvent>? data,
  }) =>
      ListEventResponseModel(
        data: data ?? this.data,
      );

  factory ListEventResponseModel.fromJson(Map<String, dynamic> json) =>
      ListEventResponseModel(
        data: json["data"] == null
            ? []
            : List<DatumEvent>.from(
                json["data"]!.map((x) => DatumEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumEvent {
  int? id;
  String? kategori;
  String? judul;
  DateTime? tanggalRace;
  String? tempatRace;
  int? isKolektif;
  DateTime? tanggalMulaiKolektif;
  DateTime? tanggalSelesaiKolektif;
  String? foto;
  String? racePack;
  int? harga;
  int? poin;
  String? linkInformasi;
  bool? isRegistered;
  String? registrationStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumEvent({
    this.id,
    this.kategori,
    this.judul,
    this.tanggalRace,
    this.tempatRace,
    this.isKolektif,
    this.tanggalMulaiKolektif,
    this.tanggalSelesaiKolektif,
    this.foto,
    this.racePack,
    this.harga,
    this.poin,
    this.linkInformasi,
    this.isRegistered,
    this.registrationStatus,
    this.createdAt,
    this.updatedAt,
  });

  DatumEvent copyWith({
    int? id,
    String? kategori,
    String? judul,
    DateTime? tanggalRace,
    String? tempatRace,
    int? isKolektif,
    DateTime? tanggalMulaiKolektif,
    DateTime? tanggalSelesaiKolektif,
    String? foto,
    String? racePack,
    int? harga,
    int? poin,
    String? linkInformasi,
    bool? isRegistered,
    String? registrationStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DatumEvent(
        id: id ?? this.id,
        kategori: kategori ?? this.kategori,
        judul: judul ?? this.judul,
        tanggalRace: tanggalRace ?? this.tanggalRace,
        tempatRace: tempatRace ?? this.tempatRace,
        isKolektif: isKolektif ?? this.isKolektif,
        tanggalMulaiKolektif: tanggalMulaiKolektif ?? this.tanggalMulaiKolektif,
        tanggalSelesaiKolektif:
            tanggalSelesaiKolektif ?? this.tanggalSelesaiKolektif,
        foto: foto ?? this.foto,
        racePack: racePack ?? this.racePack,
        harga: harga ?? this.harga,
        poin: poin ?? this.poin,
        linkInformasi: linkInformasi ?? this.linkInformasi,
        isRegistered: isRegistered ?? this.isRegistered,
        registrationStatus: registrationStatus ?? this.registrationStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DatumEvent.fromJson(Map<String, dynamic> json) => DatumEvent(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        tanggalRace: json["tanggal_race"] == null
            ? null
            : DateTime.tryParse(json["tanggal_race"]),
        tempatRace: json["tempat_race"],
        isKolektif: json["is_kolektif"],
        tanggalMulaiKolektif: json["tanggal_mulai_kolektif"] == null
            ? null
            : DateTime.tryParse(json["tanggal_mulai_kolektif"]),
        tanggalSelesaiKolektif: json["tanggal_selesai_kolektif"] == null
            ? null
            : DateTime.tryParse(json["tanggal_selesai_kolektif"]),
        foto: json["foto_url"],
        racePack: json["race_pack"],
        harga: json["harga"],
        poin: json["poin"],
        linkInformasi: json["link_informasi"],
        isRegistered: json["is_registered"],
        registrationStatus: json["registration_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "tanggal_race": tanggalRace?.toDateString(),
        "tempat_race": tempatRace,
        "is_kolektif": isKolektif,
        "tanggal_mulai_kolektif": tanggalMulaiKolektif?.toDateString(),
        "tanggal_selesai_kolektif": tanggalSelesaiKolektif?.toDateString(),
        "foto": foto,
        "race_pack": racePack,
        "harga": harga,
        "poin": poin,
        "link_informasi": linkInformasi,
        "is_registered": isRegistered,
        "registration_status": registrationStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
