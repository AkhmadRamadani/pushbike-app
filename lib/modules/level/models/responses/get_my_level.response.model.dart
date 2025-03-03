// To parse this JSON data, do
//
//     final getMyLevelResponseModel = getMyLevelResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

GetMyLevelResponseModel getMyLevelResponseModelFromJson(String str) =>
    GetMyLevelResponseModel.fromJson(json.decode(str));

String getMyLevelResponseModelToJson(GetMyLevelResponseModel data) =>
    json.encode(data.toJson());

class GetMyLevelResponseModel {
  Level? level;
  int? pointToNextLevel;
  int? currentPoint;
  List<Level>? allLevels;
  double? currentPage;
  Level? nextLevel;

  GetMyLevelResponseModel({
    this.level,
    this.pointToNextLevel,
    this.currentPoint,
    this.allLevels,
    this.currentPage,
    this.nextLevel,
  });

  GetMyLevelResponseModel copyWith({
    Level? level,
    int? pointToNextLevel,
    int? currentPoint,
    List<Level>? allLevels,
    double? currentPage,
    Level? nextLevel,
  }) =>
      GetMyLevelResponseModel(
        level: level ?? this.level,
        pointToNextLevel: pointToNextLevel ?? this.pointToNextLevel,
        currentPoint: currentPoint ?? this.currentPoint,
        allLevels: allLevels ?? this.allLevels,
        currentPage: currentPage ?? this.currentPage,
        nextLevel: nextLevel ?? this.nextLevel,
      );

  factory GetMyLevelResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMyLevelResponseModel(
        level: json["level"] == null ? null : Level.fromJson(json["level"]),
        pointToNextLevel: json["point_to_next_level"],
        currentPoint: json["current_point"],
        allLevels: json["all_levels"] == null
            ? []
            : List<Level>.from(
                json["all_levels"]!.map((x) => Level.fromJson(x))),
        currentPage: json["current_page"]?.toDouble(),
        nextLevel: json["next_level"] == null
            ? null
            : Level.fromJson(json["next_level"]),
      );

  Map<String, dynamic> toJson() => {
        "level": level?.toJson(),
        "point_to_next_level": pointToNextLevel,
        "current_point": currentPoint,
        "all_levels": allLevels == null
            ? []
            : List<dynamic>.from(allLevels!.map((x) => x.toJson())),
        "current_page": currentPage,
        "next_level": nextLevel?.toJson(),
      };
}
