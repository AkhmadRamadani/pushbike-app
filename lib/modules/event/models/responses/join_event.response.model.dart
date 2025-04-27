// To parse this JSON data, do
//
//     final joinEventResponseModel = joinEventResponseModelFromJson(jsonString);

import 'dart:convert';

JoinEventResponseModel joinEventResponseModelFromJson(String str) =>
    JoinEventResponseModel.fromJson(json.decode(str));

String joinEventResponseModelToJson(JoinEventResponseModel data) =>
    json.encode(data.toJson());

class JoinEventResponseModel {
  String? message;
  Data? data;

  JoinEventResponseModel({
    this.message,
    this.data,
  });

  JoinEventResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      JoinEventResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory JoinEventResponseModel.fromJson(Map<String, dynamic> json) =>
      JoinEventResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? mEventId;
  String? mRiderId;
  String? kelas;
  int? nominal;
  dynamic fotoBukti;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.mEventId,
    this.mRiderId,
    this.kelas,
    this.nominal,
    this.fotoBukti,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data copyWith({
    String? mEventId,
    String? mRiderId,
    String? kelas,
    int? nominal,
    dynamic fotoBukti,
    String? status,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        mEventId: mEventId ?? this.mEventId,
        mRiderId: mRiderId ?? this.mRiderId,
        kelas: kelas ?? this.kelas,
        nominal: nominal ?? this.nominal,
        fotoBukti: fotoBukti ?? this.fotoBukti,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mEventId: json["m_event_id"],
        mRiderId: json["m_rider_id"],
        kelas: json["kelas"],
        nominal: json["nominal"],
        fotoBukti: json["foto_bukti"],
        status: json["status"],
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
        "kelas": kelas,
        "nominal": nominal,
        "foto_bukti": fotoBukti,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
