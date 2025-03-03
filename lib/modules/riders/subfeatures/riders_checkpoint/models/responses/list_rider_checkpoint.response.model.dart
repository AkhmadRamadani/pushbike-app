// To parse this JSON data, do
//
//     final listRiderCheckpointResponseModel = listRiderCheckpointResponseModelFromJson(jsonString);

import 'dart:convert';

ListRiderCheckpointResponseModel listRiderCheckpointResponseModelFromJson(
        String str) =>
    ListRiderCheckpointResponseModel.fromJson(json.decode(str));

String listRiderCheckpointResponseModelToJson(
        ListRiderCheckpointResponseModel data) =>
    json.encode(data.toJson());

class ListRiderCheckpointResponseModel {
  List<DatumRiderCheckpoint>? data;

  ListRiderCheckpointResponseModel({
    this.data,
  });

  ListRiderCheckpointResponseModel copyWith({
    List<DatumRiderCheckpoint>? data,
  }) =>
      ListRiderCheckpointResponseModel(
        data: data ?? this.data,
      );

  factory ListRiderCheckpointResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ListRiderCheckpointResponseModel(
        data: json["data"] == null
            ? []
            : List<DatumRiderCheckpoint>.from(
                json["data"]!.map((x) => DatumRiderCheckpoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumRiderCheckpoint {
  int? id;
  String? kategori;
  String? judul;
  String? detailInformasi;
  int? poin;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? bulan;
  TCheckpoint? tCheckpoint;

  DatumRiderCheckpoint({
    this.id,
    this.kategori,
    this.judul,
    this.detailInformasi,
    this.poin,
    this.createdAt,
    this.updatedAt,
    this.bulan,
    this.tCheckpoint,
  });

  DatumRiderCheckpoint copyWith({
    int? id,
    String? kategori,
    String? judul,
    String? detailInformasi,
    int? poin,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bulan,
    TCheckpoint? tCheckpoint,
  }) =>
      DatumRiderCheckpoint(
        id: id ?? this.id,
        kategori: kategori ?? this.kategori,
        judul: judul ?? this.judul,
        detailInformasi: detailInformasi ?? this.detailInformasi,
        poin: poin ?? this.poin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        bulan: bulan ?? this.bulan,
        tCheckpoint: tCheckpoint ?? this.tCheckpoint,
      );

  factory DatumRiderCheckpoint.fromJson(Map<String, dynamic> json) =>
      DatumRiderCheckpoint(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        detailInformasi: json["detail_informasi"],
        poin: json["poin"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bulan: json["bulan"],
        tCheckpoint: json["t_checkpoint"] == null
            ? null
            : TCheckpoint.fromJson(json["t_checkpoint"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "detail_informasi": detailInformasi,
        "poin": poin,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "bulan": bulan,
        "t_checkpoint": tCheckpoint?.toJson(),
      };
}

class TCheckpoint {
  dynamic id;
  dynamic mRiderId;
  dynamic mCheckpointId;
  int? poin;
  String? time;
  String? keterangan;
  String? buktiUrl;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  TCheckpoint({
    this.id,
    this.mRiderId,
    this.mCheckpointId,
    this.poin,
    this.time,
    this.keterangan,
    this.buktiUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  TCheckpoint copyWith({
    dynamic id,
    dynamic mRiderId,
    dynamic mCheckpointId,
    int? poin,
    String? time,
    String? keterangan,
    String? buktiUrl,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      TCheckpoint(
        id: id ?? this.id,
        mRiderId: mRiderId ?? this.mRiderId,
        mCheckpointId: mCheckpointId ?? this.mCheckpointId,
        poin: poin ?? this.poin,
        time: time ?? this.time,
        keterangan: keterangan ?? this.keterangan,
        buktiUrl: buktiUrl ?? this.buktiUrl,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory TCheckpoint.fromJson(Map<String, dynamic> json) => TCheckpoint(
        id: json["id"],
        mRiderId: json["m_rider_id"],
        mCheckpointId: json["m_checkpoint_id"],
        poin: json["poin"],
        time: json["time"],
        keterangan: json["keterangan"],
        buktiUrl: json["bukti_url"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_rider_id": mRiderId,
        "m_checkpoint_id": mCheckpointId,
        "poin": poin,
        "time": time,
        "keterangan": keterangan,
        "bukti_url": buktiUrl,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
