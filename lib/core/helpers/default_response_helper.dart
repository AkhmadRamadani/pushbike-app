import 'dart:convert';

DefaultResponseHelper defaultResponseHelperFromJson(String str) =>
    DefaultResponseHelper.fromJson(json.decode(str));

String defaultResponseHelperToJson(DefaultResponseHelper data) =>
    json.encode(data.toJson());

class DefaultResponseHelper {
  int? statusCode;
  String? message;

  DefaultResponseHelper({
    this.statusCode,
    this.message,
  });

  DefaultResponseHelper copyWith({
    int? statusCode,
    String? message,
  }) =>
      DefaultResponseHelper(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory DefaultResponseHelper.fromJson(Map<String, dynamic> json) =>
      DefaultResponseHelper(
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
      };
}
