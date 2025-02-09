// To parse this JSON data, do
//
//     final detailPengumumanResponseModel = detailPengumumanResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';
import 'package:pushbike_app/modules/information/models/responses/get_pengumuman_data.response.model.dart';

DetailPengumumanResponseModel detailPengumumanResponseModelFromJson(
        String str) =>
    DetailPengumumanResponseModel.fromJson(json.decode(str));

String detailPengumumanResponseModelToJson(
        DetailPengumumanResponseModel data) =>
    json.encode(data.toJson());

class DetailPengumumanResponseModel {
  String? message;
  Data? data;

  DetailPengumumanResponseModel({
    this.message,
    this.data,
  });

  DetailPengumumanResponseModel copyWith({
    String? message,
    Data? data,
  }) =>
      DetailPengumumanResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory DetailPengumumanResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailPengumumanResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? mPengumumanId;
  int? mRiderId;
  bool? isRead;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  DatumPengumumanModel? pengumuman;
  Rider? rider;

  Data({
    this.mPengumumanId,
    this.mRiderId,
    this.isRead,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.pengumuman,
    this.rider,
  });

  Data copyWith({
    int? mPengumumanId,
    int? mRiderId,
    bool? isRead,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
    DatumPengumumanModel? pengumuman,
    Rider? rider,
  }) =>
      Data(
        mPengumumanId: mPengumumanId ?? this.mPengumumanId,
        mRiderId: mRiderId ?? this.mRiderId,
        isRead: isRead ?? this.isRead,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        pengumuman: pengumuman ?? this.pengumuman,
        rider: rider ?? this.rider,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mPengumumanId: json["m_pengumuman_id"],
        mRiderId: json["m_rider_id"],
        isRead: json["is_read"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        pengumuman: json["pengumuman"] == null
            ? null
            : DatumPengumumanModel.fromJson(json["pengumuman"]),
        rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
      );

  Map<String, dynamic> toJson() => {
        "m_pengumuman_id": mPengumumanId,
        "m_rider_id": mRiderId,
        "is_read": isRead,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "pengumuman": pengumuman?.toJson(),
        "rider": rider?.toJson(),
      };
}
