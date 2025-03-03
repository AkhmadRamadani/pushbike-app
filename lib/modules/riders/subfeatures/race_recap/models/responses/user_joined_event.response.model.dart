// To parse this JSON data, do
//
//     final userJoinedEventResponseModel = userJoinedEventResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/riders/subfeatures/race_recap/models/responses/index_hasil_race.response.model.dart';

UserJoinedEventResponseModel userJoinedEventResponseModelFromJson(String str) =>
    UserJoinedEventResponseModel.fromJson(json.decode(str));

String userJoinedEventResponseModelToJson(UserJoinedEventResponseModel data) =>
    json.encode(data.toJson());

class UserJoinedEventResponseModel {
  DataJoinedEvent? data;

  UserJoinedEventResponseModel({
    this.data,
  });

  UserJoinedEventResponseModel copyWith({
    DataJoinedEvent? data,
  }) =>
      UserJoinedEventResponseModel(
        data: data ?? this.data,
      );

  factory UserJoinedEventResponseModel.fromJson(Map<String, dynamic> json) =>
      UserJoinedEventResponseModel(
        data: json["data"] == null ? null : DataJoinedEvent.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class DataJoinedEvent {
  List<JoinedEvent>? joinedEvents;
  List<String>? kategori;
  List<String>? listPodium;

  DataJoinedEvent({
    this.joinedEvents,
    this.kategori,
    this.listPodium,
  });

  DataJoinedEvent copyWith({
    List<JoinedEvent>? joinedEvents,
    List<String>? kategori,
    List<String>? listPodium,
  }) =>
      DataJoinedEvent(
        joinedEvents: joinedEvents ?? this.joinedEvents,
        kategori: kategori ?? this.kategori,
        listPodium: listPodium ?? this.listPodium,
      );

  factory DataJoinedEvent.fromJson(Map<String, dynamic> json) => DataJoinedEvent(
        joinedEvents: json["joinedEvents"] == null
            ? []
            : List<JoinedEvent>.from(
                json["joinedEvents"]!.map((x) => JoinedEvent.fromJson(x))),
        kategori: json["kategori"] == null
            ? []
            : List<String>.from(json["kategori"]!.map((x) => x)),
        listPodium: json["listPodium"] == null
            ? []
            : List<String>.from(json["listPodium"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "joinedEvents": joinedEvents == null
            ? []
            : List<dynamic>.from(joinedEvents!.map((x) => x.toJson())),
        "kategori":
            kategori == null ? [] : List<dynamic>.from(kategori!.map((x) => x)),
        "listPodium": listPodium == null
            ? []
            : List<dynamic>.from(listPodium!.map((x) => x)),
      };
}

class JoinedEvent {
  int? id;
  int? mRiderId;
  int? mEventId;
  String? kelas;
  dynamic nominal;
  dynamic fotoBukti;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Event? event;

  JoinedEvent({
    this.id,
    this.mRiderId,
    this.mEventId,
    this.kelas,
    this.nominal,
    this.fotoBukti,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.event,
  });

  JoinedEvent copyWith({
    int? id,
    int? mRiderId,
    int? mEventId,
    String? kelas,
    dynamic nominal,
    dynamic fotoBukti,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Event? event,
  }) =>
      JoinedEvent(
        id: id ?? this.id,
        mRiderId: mRiderId ?? this.mRiderId,
        mEventId: mEventId ?? this.mEventId,
        kelas: kelas ?? this.kelas,
        nominal: nominal ?? this.nominal,
        fotoBukti: fotoBukti ?? this.fotoBukti,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        event: event ?? this.event,
      );

  factory JoinedEvent.fromJson(Map<String, dynamic> json) => JoinedEvent(
        id: json["id"],
        mRiderId: json["m_rider_id"],
        mEventId: json["m_event_id"],
        kelas: json["kelas"],
        nominal: json["nominal"],
        fotoBukti: json["foto_bukti"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_rider_id": mRiderId,
        "m_event_id": mEventId,
        "kelas": kelas,
        "nominal": nominal,
        "foto_bukti": fotoBukti,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "event": event?.toJson(),
      };
}
