// To parse this JSON data, do
//
//     final riderHistoryPointsResponseModel = riderHistoryPointsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/core/extensions/date_extensions.dart';

RiderHistoryPointsResponseModel riderHistoryPointsResponseModelFromJson(
        String str) =>
    RiderHistoryPointsResponseModel.fromJson(json.decode(str));

String riderHistoryPointsResponseModelToJson(
        RiderHistoryPointsResponseModel data) =>
    json.encode(data.toJson());

class RiderHistoryPointsResponseModel {
  List<DatumRiderHistoryPoint>? data;

  RiderHistoryPointsResponseModel({
    this.data,
  });

  RiderHistoryPointsResponseModel copyWith({
    List<DatumRiderHistoryPoint>? data,
  }) =>
      RiderHistoryPointsResponseModel(
        data: data ?? this.data,
      );

  factory RiderHistoryPointsResponseModel.fromJson(Map<String, dynamic> json) =>
      RiderHistoryPointsResponseModel(
        data: json["data"] == null
            ? []
            : List<DatumRiderHistoryPoint>.from(
                json["data"]!.map((x) => DatumRiderHistoryPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumRiderHistoryPoint {
  DateTime? date;
  List<Point>? points;

  DatumRiderHistoryPoint({
    this.date,
    this.points,
  });

  DatumRiderHistoryPoint copyWith({
    DateTime? date,
    List<Point>? points,
  }) =>
      DatumRiderHistoryPoint(
        date: date ?? this.date,
        points: points ?? this.points,
      );

  factory DatumRiderHistoryPoint.fromJson(Map<String, dynamic> json) =>
      DatumRiderHistoryPoint(
        date: json["date"] == null ? null : DateTime.tryParse(json["date"]),
        points: json["points"] == null
            ? []
            : List<Point>.from(json["points"]!.map((x) => Point.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toDateString(),
        "points": points == null
            ? []
            : List<dynamic>.from(points!.map((x) => x.toJson())),
      };
}

class Point {
  int? id;
  int? mRiderId;
  int? poin;
  String? level;
  String? historyPoin;
  DateTime? createdAt;
  DateTime? updatedAt;

  Point({
    this.id,
    this.mRiderId,
    this.poin,
    this.level,
    this.historyPoin,
    this.createdAt,
    this.updatedAt,
  });

  Point copyWith({
    int? id,
    int? mRiderId,
    int? poin,
    String? level,
    String? historyPoin,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Point(
        id: id ?? this.id,
        mRiderId: mRiderId ?? this.mRiderId,
        poin: poin ?? this.poin,
        level: level ?? this.level,
        historyPoin: historyPoin ?? this.historyPoin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        id: json["id"],
        mRiderId: json["m_rider_id"],
        poin: json["poin"],
        level: json["level"],
        historyPoin: json["history_poin"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_rider_id": mRiderId,
        "poin": poin,
        "level": level,
        "history_poin": historyPoin,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
