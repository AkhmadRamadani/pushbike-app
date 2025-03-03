// To parse this JSON data, do
//
//     final postHasilEventResponseModel = postHasilEventResponseModelFromJson(jsonString);

import 'dart:convert';

PostHasilEventResponseModel postHasilEventResponseModelFromJson(String str) =>
    PostHasilEventResponseModel.fromJson(json.decode(str));

String postHasilEventResponseModelToJson(PostHasilEventResponseModel data) =>
    json.encode(data.toJson());

class PostHasilEventResponseModel {
  String? message;
  Data? data;

  PostHasilEventResponseModel({
    this.message,
    this.data,
  });

  PostHasilEventResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      PostHasilEventResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PostHasilEventResponseModel.fromJson(Map<String, dynamic> json) =>
      PostHasilEventResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  dynamic mEventId;
  dynamic mRiderId;
  String? kategori;
  String? podium;
  String? kelas;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.mEventId,
    this.mRiderId,
    this.kategori,
    this.podium,
    this.kelas,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data copyWith({
    dynamic mEventId,
    dynamic mRiderId,
    String? kategori,
    String? podium,
    String? kelas,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        mEventId: mEventId ?? this.mEventId,
        mRiderId: mRiderId ?? this.mRiderId,
        kategori: kategori ?? this.kategori,
        podium: podium ?? this.podium,
        kelas: kelas ?? this.kelas,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mEventId: json["m_event_id"],
        mRiderId: json["m_rider_id"],
        kategori: json["kategori"],
        podium: json["podium"],
        kelas: json["kelas"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "m_event_id": mEventId,
        "m_rider_id": mRiderId,
        "kategori": kategori,
        "podium": podium,
        "kelas": kelas,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
