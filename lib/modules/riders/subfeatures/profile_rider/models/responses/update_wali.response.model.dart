// To parse this JSON data, do
//
//     final updateWaliResponseModel = updateWaliResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateWaliResponseModel updateWaliResponseModelFromJson(String str) => UpdateWaliResponseModel.fromJson(json.decode(str));

String updateWaliResponseModelToJson(UpdateWaliResponseModel data) => json.encode(data.toJson());

class UpdateWaliResponseModel {
    String? message;
    Data? data;

    UpdateWaliResponseModel({
        this.message,
        this.data,
    });

    UpdateWaliResponseModel copyWith({
        String? message,
        Data? data,
    }) => 
        UpdateWaliResponseModel(
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory UpdateWaliResponseModel.fromJson(Map<String, dynamic> json) => UpdateWaliResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? userId;
    String? namaMama;
    String? telpMama;
    String? namaPapa;
    String? telpPapa;
    String? fileKk;
    String? fileAkte;
    String? fileKia;
    String? alamat;
    String? fotoProfile;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fileKkUrl;
    String? fileAkteUrl;
    String? fileKiaUrl;
    String? fotoProfileUrl;

    Data({
        this.id,
        this.userId,
        this.namaMama,
        this.telpMama,
        this.namaPapa,
        this.telpPapa,
        this.fileKk,
        this.fileAkte,
        this.fileKia,
        this.alamat,
        this.fotoProfile,
        this.createdAt,
        this.updatedAt,
        this.fileKkUrl,
        this.fileAkteUrl,
        this.fileKiaUrl,
        this.fotoProfileUrl,
    });

    Data copyWith({
        int? id,
        int? userId,
        String? namaMama,
        String? telpMama,
        String? namaPapa,
        String? telpPapa,
        String? fileKk,
        String? fileAkte,
        String? fileKia,
        String? alamat,
        String? fotoProfile,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? fileKkUrl,
        String? fileAkteUrl,
        String? fileKiaUrl,
        String? fotoProfileUrl,
    }) => 
        Data(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            namaMama: namaMama ?? this.namaMama,
            telpMama: telpMama ?? this.telpMama,
            namaPapa: namaPapa ?? this.namaPapa,
            telpPapa: telpPapa ?? this.telpPapa,
            fileKk: fileKk ?? this.fileKk,
            fileAkte: fileAkte ?? this.fileAkte,
            fileKia: fileKia ?? this.fileKia,
            alamat: alamat ?? this.alamat,
            fotoProfile: fotoProfile ?? this.fotoProfile,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            fileKkUrl: fileKkUrl ?? this.fileKkUrl,
            fileAkteUrl: fileAkteUrl ?? this.fileAkteUrl,
            fileKiaUrl: fileKiaUrl ?? this.fileKiaUrl,
            fotoProfileUrl: fotoProfileUrl ?? this.fotoProfileUrl,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        namaMama: json["nama_mama"],
        telpMama: json["telp_mama"],
        namaPapa: json["nama_papa"],
        telpPapa: json["telp_papa"],
        fileKk: json["file_kk"],
        fileAkte: json["file_akte"],
        fileKia: json["file_kia"],
        alamat: json["alamat"],
        fotoProfile: json["foto_profile"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fileKkUrl: json["file_kk_url"],
        fileAkteUrl: json["file_akte_url"],
        fileKiaUrl: json["file_kia_url"],
        fotoProfileUrl: json["foto_profile_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama_mama": namaMama,
        "telp_mama": telpMama,
        "nama_papa": namaPapa,
        "telp_papa": telpPapa,
        "file_kk": fileKk,
        "file_akte": fileAkte,
        "file_kia": fileKia,
        "alamat": alamat,
        "foto_profile": fotoProfile,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "file_kk_url": fileKkUrl,
        "file_akte_url": fileAkteUrl,
        "file_kia_url": fileKiaUrl,
        "foto_profile_url": fotoProfileUrl,
    };
}
