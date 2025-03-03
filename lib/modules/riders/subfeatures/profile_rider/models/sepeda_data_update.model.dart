import 'dart:io';

import 'package:dio/dio.dart';

class SepedaDataUpdateModel {
  int? id;
  int? riderId;
  String? frame;
  String? asToAsRoda;
  String? helm;
  String? panjangStem;
  String? panjangStang;
  String? diameterStang;
  String? tinggiSadel;
  String? stemToStem;
  dynamic fotoSepeda; // Bisa berupa URL (String) atau File

  SepedaDataUpdateModel({
    this.id,
    this.riderId,
    this.frame,
    this.asToAsRoda,
    this.helm,
    this.panjangStem,
    this.panjangStang,
    this.diameterStang,
    this.tinggiSadel,
    this.stemToStem,
    this.fotoSepeda,
  });

  // Convert JSON to Model
  factory SepedaDataUpdateModel.fromJson(Map<String, dynamic> json) {
    return SepedaDataUpdateModel(
      id: json['id'],
      riderId: json['m_rider_id'],
      frame: json['frame'],
      asToAsRoda: json['as_to_as_roda'],
      helm: json['helm'],
      panjangStem: json['panjang_stem'],
      panjangStang: json['panjang_stang'],
      diameterStang: json['diameter_stang'],
      tinggiSadel: json['tinggi_sadel'],
      stemToStem: json['stem_to_sadel'],
      fotoSepeda: json['foto_sepeda_url'], // Bisa URL atau File
    );
  }

  // Convert Model to JSON (untuk data biasa, tanpa file)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "m_rider_id": riderId,
      "frame": frame,
      "as_to_as_roda": asToAsRoda,
      "helm": helm,
      "panjang_stem": panjangStem,
      "panjang_stang": panjangStang,
      "diameter_stang": diameterStang,
      "tinggi_sadel": tinggiSadel,
      "stem_to_sadel": stemToStem,
    };
  }

  // Compare two objects and return a list of differences
  Map<String, dynamic> compare(SepedaDataUpdateModel newData) {
    Map<String, dynamic> differences = {};

    if (frame != newData.frame) differences['frame'] = newData.frame;
    if (asToAsRoda != newData.asToAsRoda) {
      differences['as_to_as_roda'] = newData.asToAsRoda;
    }
    if (helm != newData.helm) differences['helm'] = newData.helm;
    if (panjangStem != newData.panjangStem) {
      differences['panjang_stem'] = newData.panjangStem;
    }
    if (panjangStang != newData.panjangStang) {
      differences['panjang_stang'] = newData.panjangStang;
    }
    if (diameterStang != newData.diameterStang) {
      differences['diameter_stang'] = newData.diameterStang;
    }
    if (tinggiSadel != newData.tinggiSadel) {
      differences['tinggi_sadel'] = newData.tinggiSadel;
    }
    if (stemToStem != newData.stemToStem) {
      differences['stem_to_sadel'] = newData.stemToStem;
    }

    // Cek apakah foto baru adalah file, bukan hanya string URL
    if (newData.fotoSepeda is File) {
      differences['foto_sepeda'] = 
          MultipartFile.fromFileSync(newData.fotoSepeda.path);
      
    }

    return differences;
  }
}
