// To parse this JSON data, do
//
//     final getInitialDataProfileResponseModel = getInitialDataProfileResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/rider_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/sepeda_data_update.model.dart';
import 'package:pushbike_app/modules/riders/subfeatures/profile_rider/models/wali_data_update.model.dart';

GetInitialDataProfileResponseModel getInitialDataProfileResponseModelFromJson(
        String str) =>
    GetInitialDataProfileResponseModel.fromJson(json.decode(str));

String getInitialDataProfileResponseModelToJson(
        GetInitialDataProfileResponseModel data) =>
    json.encode(data.toJson());

class GetInitialDataProfileResponseModel {
  Data? data;

  GetInitialDataProfileResponseModel({
    this.data,
  });

  GetInitialDataProfileResponseModel copyWith({
    Data? data,
  }) =>
      GetInitialDataProfileResponseModel(
        data: data ?? this.data,
      );

  factory GetInitialDataProfileResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetInitialDataProfileResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  WaliDataUpdateModel? wali;
  RiderDataUpdateModel? rider;
  List<SepedaDataUpdateModel>? sepeda;

  Data({
    this.wali,
    this.rider,
    this.sepeda,
  });

  Data copyWith({
    WaliDataUpdateModel? wali,
    RiderDataUpdateModel? rider,
    List<SepedaDataUpdateModel>? sepeda,
  }) =>
      Data(
        wali: wali ?? this.wali,
        rider: rider ?? this.rider,
        sepeda: sepeda ?? this.sepeda,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        wali: json["wali"] == null ? null : WaliDataUpdateModel.fromJson(json["wali"]),
        rider: json["rider"] == null ? null : RiderDataUpdateModel.fromJson(json["rider"]),
        sepeda: json["sepeda"] == null
            ? []
            : List<SepedaDataUpdateModel>.from(json["sepeda"]!.map((x) => SepedaDataUpdateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "wali": wali?.toJson(),
        "rider": rider?.toJson(),
        "sepeda": sepeda == null
            ? []
            : List<dynamic>.from(sepeda!.map((x) => x.toJson())),
      };
}