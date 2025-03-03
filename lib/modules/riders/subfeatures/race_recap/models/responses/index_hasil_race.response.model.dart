// To parse this JSON data, do
//
//     final indexHasilEventResponseModel = indexHasilEventResponseModelFromJson(jsonString);

import 'dart:convert';

IndexHasilEventResponseModel indexHasilEventResponseModelFromJson(String str) =>
    IndexHasilEventResponseModel.fromJson(json.decode(str));

String indexHasilEventResponseModelToJson(IndexHasilEventResponseModel data) =>
    json.encode(data.toJson());

class IndexHasilEventResponseModel {
  List<DatumHasilEvent>? data;

  IndexHasilEventResponseModel({
    this.data,
  });

  IndexHasilEventResponseModel copyWith({
    List<DatumHasilEvent>? data,
  }) =>
      IndexHasilEventResponseModel(
        data: data ?? this.data,
      );

  factory IndexHasilEventResponseModel.fromJson(Map<String, dynamic> json) =>
      IndexHasilEventResponseModel(
        data: json["data"] == null
            ? []
            : List<DatumHasilEvent>.from(json["data"]!.map((x) => DatumHasilEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumHasilEvent {
  int? id;
  int? mEventId;
  int? mRiderId;
  String? kelas;
  String? kategori;
  String? podium;
  dynamic timestamp;
  dynamic foto;
  DateTime? createdAt;
  DateTime? updatedAt;
  Event? event;
  Rider? rider;

  DatumHasilEvent({
    this.id,
    this.mEventId,
    this.mRiderId,
    this.kelas,
    this.kategori,
    this.podium,
    this.timestamp,
    this.foto,
    this.createdAt,
    this.updatedAt,
    this.event,
    this.rider,
  });

  DatumHasilEvent copyWith({
    int? id,
    int? mEventId,
    int? mRiderId,
    String? kelas,
    String? kategori,
    String? podium,
    dynamic timestamp,
    dynamic foto,
    DateTime? createdAt,
    DateTime? updatedAt,
    Event? event,
    Rider? rider,
  }) =>
      DatumHasilEvent(
        id: id ?? this.id,
        mEventId: mEventId ?? this.mEventId,
        mRiderId: mRiderId ?? this.mRiderId,
        kelas: kelas ?? this.kelas,
        kategori: kategori ?? this.kategori,
        podium: podium ?? this.podium,
        timestamp: timestamp ?? this.timestamp,
        foto: foto ?? this.foto,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        event: event ?? this.event,
        rider: rider ?? this.rider,
      );

  factory DatumHasilEvent.fromJson(Map<String, dynamic> json) => DatumHasilEvent(
        id: json["id"],
        mEventId: json["m_event_id"],
        mRiderId: json["m_rider_id"],
        kelas: json["kelas"],
        kategori: json["kategori"],
        podium: json["podium"],
        timestamp: json["timestamp"],
        foto: json["foto"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
        rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "m_event_id": mEventId,
        "m_rider_id": mRiderId,
        "kelas": kelas,
        "kategori": kategori,
        "podium": podium,
        "timestamp": timestamp,
        "foto": foto,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "event": event?.toJson(),
        "rider": rider?.toJson(),
      };
}

class Event {
  int? id;
  String? kategori;
  String? judul;
  DateTime? tanggalRace;
  String? tempatRace;
  int? isKolektif;
  dynamic tanggalMulaiKolektif;
  dynamic tanggalSelesaiKolektif;
  String? foto;
  String? racePack;
  int? harga;
  int? poin;
  String? linkInformasi;
  DateTime? createdAt;
  DateTime? updatedAt;

  Event({
    this.id,
    this.kategori,
    this.judul,
    this.tanggalRace,
    this.tempatRace,
    this.isKolektif,
    this.tanggalMulaiKolektif,
    this.tanggalSelesaiKolektif,
    this.foto,
    this.racePack,
    this.harga,
    this.poin,
    this.linkInformasi,
    this.createdAt,
    this.updatedAt,
  });

  Event copyWith({
    int? id,
    String? kategori,
    String? judul,
    DateTime? tanggalRace,
    String? tempatRace,
    int? isKolektif,
    dynamic tanggalMulaiKolektif,
    dynamic tanggalSelesaiKolektif,
    String? foto,
    String? racePack,
    int? harga,
    int? poin,
    String? linkInformasi,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Event(
        id: id ?? this.id,
        kategori: kategori ?? this.kategori,
        judul: judul ?? this.judul,
        tanggalRace: tanggalRace ?? this.tanggalRace,
        tempatRace: tempatRace ?? this.tempatRace,
        isKolektif: isKolektif ?? this.isKolektif,
        tanggalMulaiKolektif: tanggalMulaiKolektif ?? this.tanggalMulaiKolektif,
        tanggalSelesaiKolektif:
            tanggalSelesaiKolektif ?? this.tanggalSelesaiKolektif,
        foto: foto ?? this.foto,
        racePack: racePack ?? this.racePack,
        harga: harga ?? this.harga,
        poin: poin ?? this.poin,
        linkInformasi: linkInformasi ?? this.linkInformasi,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        tanggalRace: json["tanggal_race"] == null
            ? null
            : DateTime.tryParse(json["tanggal_race"]),
        tempatRace: json["tempat_race"],
        isKolektif: json["is_kolektif"],
        tanggalMulaiKolektif: json["tanggal_mulai_kolektif"],
        tanggalSelesaiKolektif: json["tanggal_selesai_kolektif"],
        foto: json["foto"],
        racePack: json["race_pack"],
        harga: json["harga"],
        poin: json["poin"],
        linkInformasi: json["link_informasi"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "tanggal_race":
            "${tanggalRace!.year.toString().padLeft(4, '0')}-${tanggalRace!.month.toString().padLeft(2, '0')}-${tanggalRace!.day.toString().padLeft(2, '0')}",
        "tempat_race": tempatRace,
        "is_kolektif": isKolektif,
        "tanggal_mulai_kolektif": tanggalMulaiKolektif,
        "tanggal_selesai_kolektif": tanggalSelesaiKolektif,
        "foto": foto,
        "race_pack": racePack,
        "harga": harga,
        "poin": poin,
        "link_informasi": linkInformasi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Rider {
  int? id;
  int? waliId;
  String? namaLengkap;
  String? panggilan;
  String? julukan;
  DateTime? tanggalLahir;
  String? tahunLahir;
  String? domisili;
  int? tinggiBadan;
  int? panjangKaki;
  int? panjangLengan;
  int? lingkarKepala;
  String? ukuranSepatu;
  String? nomorPlat;
  String? warnaOfficial;
  String? fotoRider;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? gender;
  int? mMembershipId;
  String? fotoRiderUrl;

  Rider({
    this.id,
    this.waliId,
    this.namaLengkap,
    this.panggilan,
    this.julukan,
    this.tanggalLahir,
    this.tahunLahir,
    this.domisili,
    this.tinggiBadan,
    this.panjangKaki,
    this.panjangLengan,
    this.lingkarKepala,
    this.ukuranSepatu,
    this.nomorPlat,
    this.warnaOfficial,
    this.fotoRider,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.mMembershipId,
    this.fotoRiderUrl,
  });

  Rider copyWith({
    int? id,
    int? waliId,
    String? namaLengkap,
    String? panggilan,
    String? julukan,
    DateTime? tanggalLahir,
    String? tahunLahir,
    String? domisili,
    int? tinggiBadan,
    int? panjangKaki,
    int? panjangLengan,
    int? lingkarKepala,
    String? ukuranSepatu,
    String? nomorPlat,
    String? warnaOfficial,
    String? fotoRider,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? gender,
    int? mMembershipId,
    String? fotoRiderUrl,
  }) =>
      Rider(
        id: id ?? this.id,
        waliId: waliId ?? this.waliId,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        panggilan: panggilan ?? this.panggilan,
        julukan: julukan ?? this.julukan,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        tahunLahir: tahunLahir ?? this.tahunLahir,
        domisili: domisili ?? this.domisili,
        tinggiBadan: tinggiBadan ?? this.tinggiBadan,
        panjangKaki: panjangKaki ?? this.panjangKaki,
        panjangLengan: panjangLengan ?? this.panjangLengan,
        lingkarKepala: lingkarKepala ?? this.lingkarKepala,
        ukuranSepatu: ukuranSepatu ?? this.ukuranSepatu,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        warnaOfficial: warnaOfficial ?? this.warnaOfficial,
        fotoRider: fotoRider ?? this.fotoRider,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        gender: gender ?? this.gender,
        mMembershipId: mMembershipId ?? this.mMembershipId,
        fotoRiderUrl: fotoRiderUrl ?? this.fotoRiderUrl,
      );

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        id: json["id"],
        waliId: json["wali_id"],
        namaLengkap: json["nama_lengkap"],
        panggilan: json["panggilan"],
        julukan: json["julukan"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        tahunLahir: json["tahun_lahir"],
        domisili: json["domisili"],
        tinggiBadan: json["tinggi_badan"],
        panjangKaki: json["panjang_kaki"],
        panjangLengan: json["panjang_lengan"],
        lingkarKepala: json["lingkar_kepala"],
        ukuranSepatu: json["ukuran_sepatu"],
        nomorPlat: json["nomor_plat"],
        warnaOfficial: json["warna_official"],
        fotoRider: json["foto_rider"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        mMembershipId: json["m_membership_id"],
        fotoRiderUrl: json["foto_rider_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wali_id": waliId,
        "nama_lengkap": namaLengkap,
        "panggilan": panggilan,
        "julukan": julukan,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "tahun_lahir": tahunLahir,
        "domisili": domisili,
        "tinggi_badan": tinggiBadan,
        "panjang_kaki": panjangKaki,
        "panjang_lengan": panjangLengan,
        "lingkar_kepala": lingkarKepala,
        "ukuran_sepatu": ukuranSepatu,
        "nomor_plat": nomorPlat,
        "warna_official": warnaOfficial,
        "foto_rider": fotoRider,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "m_membership_id": mMembershipId,
        "foto_rider_url": fotoRiderUrl,
      };
}
