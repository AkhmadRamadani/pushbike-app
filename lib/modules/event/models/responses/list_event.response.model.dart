// To parse this JSON data, do
//
//     final listEventResponseModel = listEventResponseModelFromJson(jsonString);

import 'dart:convert';

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
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DatumEvent.fromJson(Map<String, dynamic> json) => DatumEvent(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        tanggalRace: json["tanggal_race"] == null
            ? null
            : DateTime.parse(json["tanggal_race"]),
        tempatRace: json["tempat_race"],
        isKolektif: json["is_kolektif"],
        tanggalMulaiKolektif: json["tanggal_mulai_kolektif"] == null
            ? null
            : DateTime.parse(json["tanggal_mulai_kolektif"]),
        tanggalSelesaiKolektif: json["tanggal_selesai_kolektif"] == null
            ? null
            : DateTime.parse(json["tanggal_selesai_kolektif"]),
        foto: json["foto"],
        racePack: json["race_pack"],
        harga: json["harga"],
        poin: json["poin"],
        linkInformasi: json["link_informasi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "tanggal_race":
            "${tanggalRace!.year.toString().padLeft(4, '0')}-${tanggalRace!.month.toString().padLeft(2, '0')}-${tanggalRace!.day.toString().padLeft(2, '0')}",
        "tempat_race": tempatRace,
        "is_kolektif": isKolektif,
        "tanggal_mulai_kolektif":
            "${tanggalMulaiKolektif!.year.toString().padLeft(4, '0')}-${tanggalMulaiKolektif!.month.toString().padLeft(2, '0')}-${tanggalMulaiKolektif!.day.toString().padLeft(2, '0')}",
        "tanggal_selesai_kolektif":
            "${tanggalSelesaiKolektif!.year.toString().padLeft(4, '0')}-${tanggalSelesaiKolektif!.month.toString().padLeft(2, '0')}-${tanggalSelesaiKolektif!.day.toString().padLeft(2, '0')}",
        "foto": foto,
        "race_pack": racePack,
        "harga": harga,
        "poin": poin,
        "link_informasi": linkInformasi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
