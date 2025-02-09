// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:pushbike_app/core/abstraction/response_model.abstraction.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel extends ResponseModelAbstraction {
  // int? statusCode;
  // String? message;
  String? accessToken;
  String? tokenType;

  LoginResponseModel({
    // this.statusCode,
    // this.message,
    this.accessToken,
    this.tokenType,
  });

  LoginResponseModel copyWith({
    // int? statusCode,
    // String? message,
    String? accessToken,
    String? tokenType,
  }) =>
      LoginResponseModel(
        // statusCode: statusCode ?? this.statusCode,
        // message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
      );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        // statusCode: json["status_code"],
        // message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        // "status_code": statusCode,
        // "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
