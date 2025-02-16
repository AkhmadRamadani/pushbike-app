// To parse this JSON data, do
//
//     final getLatestBillResponseModel = getLatestBillResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';
import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_list_membership.response.model.dart';
import 'package:pushbike_app/modules/pembayaran/models/responses/get_payment_history.response.model.dart';

GetLatestBillResponseModel getLatestBillResponseModelFromJson(String str) =>
    GetLatestBillResponseModel.fromJson(json.decode(str));

String getLatestBillResponseModelToJson(GetLatestBillResponseModel data) =>
    json.encode(data.toJson());

class GetLatestBillResponseModel {
  LatestBillData? data;

  GetLatestBillResponseModel({
    this.data,
  });

  GetLatestBillResponseModel copyWith({
    LatestBillData? data,
  }) =>
      GetLatestBillResponseModel(
        data: data ?? this.data,
      );

  factory GetLatestBillResponseModel.fromJson(Map<String, dynamic> json) =>
      GetLatestBillResponseModel(
        data:
            json["data"] == null ? null : LatestBillData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class LatestBillData {
  String? status;
  PaymentHistoryDatum? pembayaran;
  MembershipData? membership;
  PointModel? point;

  LatestBillData({
    this.status,
    this.pembayaran,
    this.membership,
    this.point,
  });

  LatestBillData copyWith({
    String? status,
    PaymentHistoryDatum? pembayaran,
    MembershipData? membership,
    PointModel? point,
  }) =>
      LatestBillData(
        status: status ?? this.status,
        pembayaran: pembayaran ?? this.pembayaran,
        membership: membership ?? this.membership,
        point: point ?? this.point,
      );

  factory LatestBillData.fromJson(Map<String, dynamic> json) => LatestBillData(
        status: json["status"],
        pembayaran: json["pembayaran"] == null
            ? null
            : PaymentHistoryDatum.fromJson(json["pembayaran"]),
        membership: json["membership"] == null
            ? null
            : MembershipData.fromJson(json["membership"]),
        point:
            json["point"] == null ? null : PointModel.fromJson(json["point"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "pembayaran": pembayaran?.toJson(),
        "membership": membership?.toJson(),
        "point": point?.toJson(),
      };
}
