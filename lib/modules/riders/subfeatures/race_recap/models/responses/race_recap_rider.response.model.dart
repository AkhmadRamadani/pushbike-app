// To parse this JSON data, do
//
//     final raceRecapRiderResponseModel = raceRecapRiderResponseModelFromJson(jsonString);

import 'dart:convert';

RaceRecapRiderResponseModel raceRecapRiderResponseModelFromJson(String str) => RaceRecapRiderResponseModel.fromJson(json.decode(str));

String raceRecapRiderResponseModelToJson(RaceRecapRiderResponseModel data) => json.encode(data.toJson());

class RaceRecapRiderResponseModel {
    DataRaceRecapRider? data;

    RaceRecapRiderResponseModel({
        this.data,
    });

    RaceRecapRiderResponseModel copyWith({
        DataRaceRecapRider? data,
    }) => 
        RaceRecapRiderResponseModel(
            data: data ?? this.data,
        );

    factory RaceRecapRiderResponseModel.fromJson(Map<String, dynamic> json) => RaceRecapRiderResponseModel(
        data: json["data"] == null ? null : DataRaceRecapRider.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class DataRaceRecapRider {
    int? totalRaceThisMonth;
    int? totalRace;
    int? totalPoints;

    DataRaceRecapRider({
        this.totalRaceThisMonth,
        this.totalRace,
        this.totalPoints,
    });

    DataRaceRecapRider copyWith({
        int? totalRaceThisMonth,
        int? totalRace,
        int? totalPoints,
    }) => 
        DataRaceRecapRider(
            totalRaceThisMonth: totalRaceThisMonth ?? this.totalRaceThisMonth,
            totalRace: totalRace ?? this.totalRace,
            totalPoints: totalPoints ?? this.totalPoints,
        );

    factory DataRaceRecapRider.fromJson(Map<String, dynamic> json) => DataRaceRecapRider(
        totalRaceThisMonth: json["totalRaceThisMonth"],
        totalRace: json["totalRace"],
        totalPoints: json["totalPoints"],
    );

    Map<String, dynamic> toJson() => {
        "totalRaceThisMonth": totalRaceThisMonth,
        "totalRace": totalRace,
        "totalPoints": totalPoints,
    };
}
