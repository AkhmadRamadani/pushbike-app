// To parse this JSON data, do
//
//     final getPaymetHistoryResponseModel = getPaymetHistoryResponseModelFromJson(jsonString);
import 'dart:convert';

import 'package:pushbike_app/core/abstraction/paginate_response_model.abstraction.dart';

GetPaymetHistoryResponseModel getPaymetHistoryResponseModelFromJson(
        String str) =>
    GetPaymetHistoryResponseModel.fromJson(json.decode(str));

String getPaymetHistoryResponseModelToJson(
        GetPaymetHistoryResponseModel data) =>
    json.encode(data.toJson());

class GetPaymetHistoryResponseModel {
  PaginationAbstraction<PaymentHistoryDatum>? data;

  GetPaymetHistoryResponseModel({
    this.data,
  });

  GetPaymetHistoryResponseModel copyWith({
    PaginationAbstraction<PaymentHistoryDatum>? data,
  }) =>
      GetPaymetHistoryResponseModel(
        data: data ?? this.data,
      );

  factory GetPaymetHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      GetPaymetHistoryResponseModel(
        data: json["data"] == null
            ? null
            : PaginationAbstraction<PaymentHistoryDatum>.fromJson(
                json["data"], (x) => PaymentHistoryDatum.fromJson(x)),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson((x) => x.toJson()),
      };
}

class PaymentHistoryDatum {
  int? id;
  String? kategori;
  int? mRiderId;
  String? kelas;
  String? nominal;
  String? buktiPembayaran;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaymentHistoryDatum({
    this.id,
    this.kategori,
    this.mRiderId,
    this.kelas,
    this.nominal,
    this.buktiPembayaran,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PaymentHistoryDatum copyWith({
    int? id,
    String? kategori,
    int? mRiderId,
    String? kelas,
    String? nominal,
    String? buktiPembayaran,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PaymentHistoryDatum(
        id: id ?? this.id,
        kategori: kategori ?? this.kategori,
        mRiderId: mRiderId ?? this.mRiderId,
        kelas: kelas ?? this.kelas,
        nominal: nominal ?? this.nominal,
        buktiPembayaran: buktiPembayaran ?? this.buktiPembayaran,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaymentHistoryDatum.fromJson(Map<String, dynamic> json) =>
      PaymentHistoryDatum(
        id: json["id"],
        kategori: json["kategori"],
        mRiderId: json["m_rider_id"],
        kelas: json["kelas"],
        nominal: json["nominal"],
        buktiPembayaran: json["bukti_pembayaran"],
        status: json["status"],
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
        "m_rider_id": mRiderId,
        "kelas": kelas,
        "nominal": nominal,
        "bukti_pembayaran": buktiPembayaran,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  num get nominalNum => num.tryParse(nominal ?? '0') ?? 0;
}
