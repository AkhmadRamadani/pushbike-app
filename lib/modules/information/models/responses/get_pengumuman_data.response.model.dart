// To parse this JSON data, do
//
//     final getPengumumanDataResponseModel = getPengumumanDataResponseModelFromJson(jsonString);

import 'dart:convert';

GetPengumumanDataResponseModel getPengumumanDataResponseModelFromJson(
        String str) =>
    GetPengumumanDataResponseModel.fromJson(json.decode(str));

String getPengumumanDataResponseModelToJson(
        GetPengumumanDataResponseModel data) =>
    json.encode(data.toJson());

class GetPengumumanDataResponseModel {
  List<DatumPengumumanModel>? data;
  int? totalUnread;

  GetPengumumanDataResponseModel({
    this.data,
    this.totalUnread,
  });

  GetPengumumanDataResponseModel copyWith({
    List<DatumPengumumanModel>? data,
    int? totalUnread,
  }) =>
      GetPengumumanDataResponseModel(
        data: data ?? this.data,
        totalUnread: totalUnread ?? this.totalUnread,
      );

  factory GetPengumumanDataResponseModel.fromJson(Map<String, dynamic> json) =>
      GetPengumumanDataResponseModel(
        data: json["items"] == null
            ? []
            : List<DatumPengumumanModel>.from(
                json["items"]!.map((x) => DatumPengumumanModel.fromJson(x))),
        totalUnread: json["total_unread"],
      );

  Map<String, dynamic> toJson() => {
        "items": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total_unread": totalUnread,
      };
}

class DatumPengumumanModel {
  int? id;
  String? judul;
  String? deskripsi;
  CreatedBy? createdBy;
  int? pinPengumuman;
  int? pushNotifikasi;
  bool? isRead;
  String? foto;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumPengumumanModel({
    this.id,
    this.judul,
    this.deskripsi,
    this.createdBy,
    this.pinPengumuman,
    this.pushNotifikasi,
    this.isRead,
    this.foto,
    this.createdAt,
    this.updatedAt,
  });

  DatumPengumumanModel copyWith({
    int? id,
    String? judul,
    String? deskripsi,
    CreatedBy? createdBy,
    int? pinPengumuman,
    int? pushNotifikasi,
    bool? isRead,
    String? foto,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DatumPengumumanModel(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        createdBy: createdBy ?? this.createdBy,
        pinPengumuman: pinPengumuman ?? this.pinPengumuman,
        pushNotifikasi: pushNotifikasi ?? this.pushNotifikasi,
        isRead: isRead ?? this.isRead,
        foto: foto ?? this.foto,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DatumPengumumanModel.fromJson(Map<String, dynamic> json) =>
      DatumPengumumanModel(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(json["created_by"]),
        pinPengumuman: json["pin_pengumuman"],
        pushNotifikasi: json["push_notifikasi"],
        isRead: json["is_read"],
        foto: json["foto"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "created_by": createdBy?.toJson(),
        "pin_pengumuman": pinPengumuman,
        "push_notifikasi": pushNotifikasi,
        "is_read": isRead,
        "foto": foto,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class CreatedBy {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? role;
  int? mKomunitasId;
  DateTime? createdAt;
  DateTime? updatedAt;

  CreatedBy({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.mKomunitasId,
    this.createdAt,
    this.updatedAt,
  });

  CreatedBy copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    String? role,
    int? mKomunitasId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CreatedBy(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        role: role ?? this.role,
        mKomunitasId: mKomunitasId ?? this.mKomunitasId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.tryParse(json["email_verified_at"]),
        role: json["role"],
        mKomunitasId: json["m_komunitas_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "role": role,
        "m_komunitas_id": mKomunitasId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
