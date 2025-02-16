// To parse this JSON data, do
//
//     final getListMembershipResponseModel = getListMembershipResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

GetListMembershipResponseModel getListMembershipResponseModelFromJson(
        String str) =>
    GetListMembershipResponseModel.fromJson(json.decode(str));

String getListMembershipResponseModelToJson(
        GetListMembershipResponseModel data) =>
    json.encode(data.toJson());

class GetListMembershipResponseModel {
  List<MembershipData>? data;

  GetListMembershipResponseModel({
    this.data,
  });

  GetListMembershipResponseModel copyWith({
    List<MembershipData>? data,
  }) =>
      GetListMembershipResponseModel(
        data: data ?? this.data,
      );

  factory GetListMembershipResponseModel.fromJson(Map<String, dynamic> json) =>
      GetListMembershipResponseModel(
        data: json["data"] == null
            ? []
            : List<MembershipData>.from(
                json["data"]!.map((x) => MembershipData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
