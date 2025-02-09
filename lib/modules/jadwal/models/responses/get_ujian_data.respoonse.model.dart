// To parse this JSON data, do
//
//     final getUjianDataResponseModel = getUjianDataResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/jadwal/models/responses/get_event_calendar.response.model.dart';

GetUjianDataResponseModel getUjianDataResponseModelFromJson(String str) =>
    GetUjianDataResponseModel.fromJson(json.decode(str));

String getUjianDataResponseModelToJson(GetUjianDataResponseModel data) =>
    json.encode(data.toJson());

class GetUjianDataResponseModel {
  List<DatumEventCalendar>? data;

  GetUjianDataResponseModel({
    this.data,
  });

  GetUjianDataResponseModel copyWith({
    List<DatumEventCalendar>? data,
  }) =>
      GetUjianDataResponseModel(
        data: data ?? this.data,
      );

  factory GetUjianDataResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUjianDataResponseModel(
        data: json["data"] == null
            ? []
            : List<DatumEventCalendar>.from(
                json["data"]!.map((x) => DatumEventCalendar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
