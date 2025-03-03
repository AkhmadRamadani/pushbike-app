// To parse this JSON data, do
//
//     final updateSepedaResponseModel = updateSepedaResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateSepedaResponseModel updateSepedaResponseModelFromJson(String str) => UpdateSepedaResponseModel.fromJson(json.decode(str));

String updateSepedaResponseModelToJson(UpdateSepedaResponseModel data) => json.encode(data.toJson());

class UpdateSepedaResponseModel {
    String? message;
    Data? data;

    UpdateSepedaResponseModel({
        this.message,
        this.data,
    });

    UpdateSepedaResponseModel copyWith({
        String? message,
        Data? data,
    }) => 
        UpdateSepedaResponseModel(
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory UpdateSepedaResponseModel.fromJson(Map<String, dynamic> json) => UpdateSepedaResponseModel(
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
    int? mRiderId;
    String? frame;
    String? asToAsRoda;
    String? helm;
    String? panjangStem;
    String? panjangStang;
    String? diameterStang;
    String? tinggiSadel;
    String? stemToSadel;
    dynamic fotoSepeda;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic fotoSepedaUrl;

    Data({
        this.id,
        this.mRiderId,
        this.frame,
        this.asToAsRoda,
        this.helm,
        this.panjangStem,
        this.panjangStang,
        this.diameterStang,
        this.tinggiSadel,
        this.stemToSadel,
        this.fotoSepeda,
        this.createdAt,
        this.updatedAt,
        this.fotoSepedaUrl,
    });

    Data copyWith({
        int? id,
        int? mRiderId,
        String? frame,
        String? asToAsRoda,
        String? helm,
        String? panjangStem,
        String? panjangStang,
        String? diameterStang,
        String? tinggiSadel,
        String? stemToSadel,
        dynamic fotoSepeda,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic fotoSepedaUrl,
    }) => 
        Data(
            id: id ?? this.id,
            mRiderId: mRiderId ?? this.mRiderId,
            frame: frame ?? this.frame,
            asToAsRoda: asToAsRoda ?? this.asToAsRoda,
            helm: helm ?? this.helm,
            panjangStem: panjangStem ?? this.panjangStem,
            panjangStang: panjangStang ?? this.panjangStang,
            diameterStang: diameterStang ?? this.diameterStang,
            tinggiSadel: tinggiSadel ?? this.tinggiSadel,
            stemToSadel: stemToSadel ?? this.stemToSadel,
            fotoSepeda: fotoSepeda ?? this.fotoSepeda,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            fotoSepedaUrl: fotoSepedaUrl ?? this.fotoSepedaUrl,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        mRiderId: json["m_rider_id"],
        frame: json["frame"],
        asToAsRoda: json["as_to_as_roda"],
        helm: json["helm"],
        panjangStem: json["panjang_stem"],
        panjangStang: json["panjang_stang"],
        diameterStang: json["diameter_stang"],
        tinggiSadel: json["tinggi_sadel"],
        stemToSadel: json["stem_to_sadel"],
        fotoSepeda: json["foto_sepeda"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoSepedaUrl: json["foto_sepeda_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "m_rider_id": mRiderId,
        "frame": frame,
        "as_to_as_roda": asToAsRoda,
        "helm": helm,
        "panjang_stem": panjangStem,
        "panjang_stang": panjangStang,
        "diameter_stang": diameterStang,
        "tinggi_sadel": tinggiSadel,
        "stem_to_sadel": stemToSadel,
        "foto_sepeda": fotoSepeda,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_sepeda_url": fotoSepedaUrl,
    };
}
