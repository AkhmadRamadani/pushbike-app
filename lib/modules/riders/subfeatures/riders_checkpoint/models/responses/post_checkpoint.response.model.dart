// To parse this JSON data, do
//
//     final postCheckpointResponseModel = postCheckpointResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/riders/subfeatures/riders_checkpoint/models/responses/list_rider_checkpoint.response.model.dart';

PostCheckpointResponseModel postCheckpointResponseModelFromJson(String str) =>
    PostCheckpointResponseModel.fromJson(json.decode(str));

String postCheckpointResponseModelToJson(PostCheckpointResponseModel data) =>
    json.encode(data.toJson());

class PostCheckpointResponseModel {
  PostCheckpointResponseModelData? data;

  PostCheckpointResponseModel({
    this.data,
  });

  PostCheckpointResponseModel copyWith({
    PostCheckpointResponseModelData? data,
  }) =>
      PostCheckpointResponseModel(
        data: data ?? this.data,
      );

  factory PostCheckpointResponseModel.fromJson(Map<String, dynamic> json) =>
      PostCheckpointResponseModel(
        data: json["data"] == null
            ? null
            : PostCheckpointResponseModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class PostCheckpointResponseModelData {
  String? message;
  TCheckpoint? data;

  PostCheckpointResponseModelData({
    this.message,
    this.data,
  });

  PostCheckpointResponseModelData copyWith({
    String? message,
    TCheckpoint? data,
  }) =>
      PostCheckpointResponseModelData(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory PostCheckpointResponseModelData.fromJson(Map<String, dynamic> json) =>
      PostCheckpointResponseModelData(
        message: json["message"],
        data: json["data"] == null ? null : TCheckpoint.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}
