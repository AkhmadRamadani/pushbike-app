// To parse this JSON data, do
//
//     final postPembayaranResponseModel = postPembayaranResponseModelFromJson(jsonString);

import 'dart:convert';

PostPembayaranResponseModel postPembayaranResponseModelFromJson(String str) =>
    PostPembayaranResponseModel.fromJson(json.decode(str));

String postPembayaranResponseModelToJson(PostPembayaranResponseModel data) =>
    json.encode(data.toJson());

class PostPembayaranResponseModel {
  Data? data;

  PostPembayaranResponseModel({
    this.data,
  });

  PostPembayaranResponseModel copyWith({
    Data? data,
  }) =>
      PostPembayaranResponseModel(
        data: data ?? this.data,
      );

  factory PostPembayaranResponseModel.fromJson(Map<String, dynamic> json) =>
      PostPembayaranResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  String? message;
  Pembayaran? pembayaran;

  Data({
    this.message,
    this.pembayaran,
  });

  Data copyWith({
    String? message,
    Pembayaran? pembayaran,
  }) =>
      Data(
        message: message ?? this.message,
        pembayaran: pembayaran ?? this.pembayaran,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        pembayaran: json["pembayaran"] == null
            ? null
            : Pembayaran.fromJson(json["pembayaran"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "pembayaran": pembayaran?.toJson(),
      };
}

class Pembayaran {
  String? kategori;
  int? mRiderId;
  String? kelas;
  dynamic nominal;
  String? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Pembayaran({
    this.kategori,
    this.mRiderId,
    this.kelas,
    this.nominal,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Pembayaran copyWith({
    String? kategori,
    int? mRiderId,
    String? kelas,
    dynamic nominal,
    String? status,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Pembayaran(
        kategori: kategori ?? this.kategori,
        mRiderId: mRiderId ?? this.mRiderId,
        kelas: kelas ?? this.kelas,
        nominal: nominal ?? this.nominal,
        status: status ?? this.status,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
        kategori: json["kategori"],
        mRiderId: json["m_rider_id"],
        kelas: json["kelas"],
        nominal: json["nominal"],
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
        "kategori": kategori,
        "m_rider_id": mRiderId,
        "kelas": kelas,
        "nominal": nominal,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
