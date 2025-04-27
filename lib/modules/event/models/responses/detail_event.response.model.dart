// To parse this JSON data, do
//
//     final detailEventResponseModel = detailEventResponseModelFromJson(jsonString);

import 'dart:convert';

DetailEventResponseModel detailEventResponseModelFromJson(String str) => DetailEventResponseModel.fromJson(json.decode(str));

String detailEventResponseModelToJson(DetailEventResponseModel data) => json.encode(data.toJson());

class DetailEventResponseModel {
    Data? data;

    DetailEventResponseModel({
        this.data,
    });

    DetailEventResponseModel copyWith({
        Data? data,
    }) => 
        DetailEventResponseModel(
            data: data ?? this.data,
        );

    factory DetailEventResponseModel.fromJson(Map<String, dynamic> json) => DetailEventResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
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
    String? fotoUrl;
  bool? isRegistered;
  String? registrationStatus;
    List<Peserta>? peserta;

    Data({
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
        this.fotoUrl,
        this.isRegistered,
        this.registrationStatus,
        this.peserta,
    });

    Data copyWith({
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
        String? fotoUrl,
        bool? isRegistered,
        String? registrationStatus,
        List<Peserta>? peserta,
    }) => 
        Data(
            id: id ?? this.id,
            kategori: kategori ?? this.kategori,
            judul: judul ?? this.judul,
            tanggalRace: tanggalRace ?? this.tanggalRace,
            tempatRace: tempatRace ?? this.tempatRace,
            isKolektif: isKolektif ?? this.isKolektif,
            tanggalMulaiKolektif: tanggalMulaiKolektif ?? this.tanggalMulaiKolektif,
            tanggalSelesaiKolektif: tanggalSelesaiKolektif ?? this.tanggalSelesaiKolektif,
            foto: foto ?? this.foto,
            racePack: racePack ?? this.racePack,
            harga: harga ?? this.harga,
            poin: poin ?? this.poin,
            linkInformasi: linkInformasi ?? this.linkInformasi,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            fotoUrl: fotoUrl ?? this.fotoUrl,
            isRegistered: isRegistered ?? this.isRegistered,
            registrationStatus: registrationStatus ?? this.registrationStatus,
            peserta: peserta ?? this.peserta,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        kategori: json["kategori"],
        judul: json["judul"],
        tanggalRace: json["tanggal_race"] == null ? null : DateTime.parse(json["tanggal_race"]),
        tempatRace: json["tempat_race"],
        isKolektif: json["is_kolektif"],
        tanggalMulaiKolektif: json["tanggal_mulai_kolektif"],
        tanggalSelesaiKolektif: json["tanggal_selesai_kolektif"],
        foto: json["foto"],
        racePack: json["race_pack"],
        harga: json["harga"],
        poin: json["poin"],
        linkInformasi: json["link_informasi"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
        isRegistered: json["is_registered"],
        registrationStatus: json["registration_status"],
        peserta: json["peserta"] == null ? [] : List<Peserta>.from(json["peserta"]!.map((x) => Peserta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "judul": judul,
        "tanggal_race": "${tanggalRace!.year.toString().padLeft(4, '0')}-${tanggalRace!.month.toString().padLeft(2, '0')}-${tanggalRace!.day.toString().padLeft(2, '0')}",
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
        "foto_url": fotoUrl,
        "is_registered": isRegistered,
        "registration_status": registrationStatus,
        "peserta": peserta == null ? [] : List<dynamic>.from(peserta!.map((x) => x.toJson())),
    };
}

class Peserta {
    int? id;
    int? mRiderId;
    int? mEventId;
    String? kelas;
    dynamic nominal;
    dynamic fotoBukti;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    Rider? rider;

    Peserta({
        this.id,
        this.mRiderId,
        this.mEventId,
        this.kelas,
        this.nominal,
        this.fotoBukti,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.rider,
    });

    Peserta copyWith({
        int? id,
        int? mRiderId,
        int? mEventId,
        String? kelas,
        dynamic nominal,
        dynamic fotoBukti,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        Rider? rider,
    }) => 
        Peserta(
            id: id ?? this.id,
            mRiderId: mRiderId ?? this.mRiderId,
            mEventId: mEventId ?? this.mEventId,
            kelas: kelas ?? this.kelas,
            nominal: nominal ?? this.nominal,
            fotoBukti: fotoBukti ?? this.fotoBukti,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            rider: rider ?? this.rider,
        );

    factory Peserta.fromJson(Map<String, dynamic> json) => Peserta(
        id: json["id"],
        mRiderId: json["m_rider_id"],
        mEventId: json["m_event_id"],
        kelas: json["kelas"],
        nominal: json["nominal"],
        fotoBukti: json["foto_bukti"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
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
        "rider": rider?.toJson(),
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
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
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
