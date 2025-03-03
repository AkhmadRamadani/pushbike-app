// To parse this JSON data, do
//
//     final userDataResponseModel = userDataResponseModelFromJson(jsonString);

import 'dart:convert';

UserDataResponseModel userDataResponseModelFromJson(String str) =>
    UserDataResponseModel.fromJson(json.decode(str));

String userDataResponseModelToJson(UserDataResponseModel data) =>
    json.encode(data.toJson());

class UserDataResponseModel {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? role;
  int? mKomunitasId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Wali? wali;
  Komunitas? komunitas;

  UserDataResponseModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.mKomunitasId,
    this.createdAt,
    this.updatedAt,
    this.wali,
    this.komunitas,
  });

  UserDataResponseModel copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    String? role,
    int? mKomunitasId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Wali? wali,
    Komunitas? komunitas,
  }) =>
      UserDataResponseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        role: role ?? this.role,
        mKomunitasId: mKomunitasId ?? this.mKomunitasId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        wali: wali ?? this.wali,
        komunitas: komunitas ?? this.komunitas,
      );

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      UserDataResponseModel(
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
        wali: json["wali"] == null ? null : Wali.fromJson(json["wali"]),
        komunitas: json["komunitas"] == null
            ? null
            : Komunitas.fromJson(json["komunitas"]),
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
        "wali": wali?.toJson(),
        "komunitas": komunitas?.toJson(),
      };
}

class Komunitas {
  int? id;
  String? nama;
  String? pic;
  String? noTelpPic;
  String? alamat;
  String? logoUrl;
  String? warnaBg;
  DateTime? tanggalBerlangganan;
  int? maksimalRider;
  DateTime? createdAt;
  DateTime? updatedAt;

  Komunitas({
    this.id,
    this.nama,
    this.pic,
    this.noTelpPic,
    this.alamat,
    this.logoUrl,
    this.warnaBg,
    this.tanggalBerlangganan,
    this.maksimalRider,
    this.createdAt,
    this.updatedAt,
  });

  Komunitas copyWith({
    int? id,
    String? nama,
    String? pic,
    String? noTelpPic,
    String? alamat,
    String? logoUrl,
    String? warnaBg,
    DateTime? tanggalBerlangganan,
    int? maksimalRider,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Komunitas(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        pic: pic ?? this.pic,
        noTelpPic: noTelpPic ?? this.noTelpPic,
        alamat: alamat ?? this.alamat,
        logoUrl: logoUrl ?? this.logoUrl,
        warnaBg: warnaBg ?? this.warnaBg,
        tanggalBerlangganan: tanggalBerlangganan ?? this.tanggalBerlangganan,
        maksimalRider: maksimalRider ?? this.maksimalRider,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Komunitas.fromJson(Map<String, dynamic> json) => Komunitas(
        id: json["id"],
        nama: json["nama"],
        pic: json["pic"],
        noTelpPic: json["no_telp_pic"],
        alamat: json["alamat"],
        logoUrl: json["logo_url"],
        warnaBg: json["warna_bg"],
        tanggalBerlangganan: json["tanggal_berlangganan"] == null
            ? null
            : DateTime.tryParse(json["tanggal_berlangganan"]),
        maksimalRider: json["maksimal_rider"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "pic": pic,
        "no_telp_pic": noTelpPic,
        "alamat": alamat,
        "logo_url": logoUrl,
        "warna_bg": warnaBg,
        "tanggal_berlangganan":
            "${tanggalBerlangganan!.year.toString().padLeft(4, '0')}-${tanggalBerlangganan!.month.toString().padLeft(2, '0')}-${tanggalBerlangganan!.day.toString().padLeft(2, '0')}",
        "maksimal_rider": maksimalRider,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Wali {
  int? id;
  int? userId;
  String? namaMama;
  String? telpMama;
  String? namaPapa;
  String? telpPapa;
  String? fileKkUrl;
  String? fileAkteUrl;
  String? fileKiaUrl;
  String? alamat;
  String? fotoProfileUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Rider>? riders;

  Wali({
    this.id,
    this.userId,
    this.namaMama,
    this.telpMama,
    this.namaPapa,
    this.telpPapa,
    this.fileKkUrl,
    this.fileAkteUrl,
    this.fileKiaUrl,
    this.alamat,
    this.fotoProfileUrl,
    this.createdAt,
    this.updatedAt,
    this.riders,
  });

  Wali copyWith({
    int? id,
    int? userId,
    String? namaMama,
    String? telpMama,
    String? namaPapa,
    String? telpPapa,
    String? fileKkUrl,
    String? fileAkteUrl,
    String? fileKiaUrl,
    String? alamat,
    String? fotoProfileUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Rider>? riders,
    MembershipData? membership,
  }) =>
      Wali(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        namaMama: namaMama ?? this.namaMama,
        telpMama: telpMama ?? this.telpMama,
        namaPapa: namaPapa ?? this.namaPapa,
        telpPapa: telpPapa ?? this.telpPapa,
        fileKkUrl: fileKkUrl ?? this.fileKkUrl,
        fileAkteUrl: fileAkteUrl ?? this.fileAkteUrl,
        fileKiaUrl: fileKiaUrl ?? this.fileKiaUrl,
        alamat: alamat ?? this.alamat,
        fotoProfileUrl: fotoProfileUrl ?? this.fotoProfileUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        riders: riders ?? this.riders,
      );

  factory Wali.fromJson(Map<String, dynamic> json) => Wali(
        id: json["id"],
        userId: json["user_id"],
        namaMama: json["nama_mama"],
        telpMama: json["telp_mama"],
        namaPapa: json["nama_papa"],
        telpPapa: json["telp_papa"],
        fileKkUrl: json["file_kk_url"],
        fileAkteUrl: json["file_akte_url"],
        fileKiaUrl: json["file_kia_url"],
        alamat: json["alamat"],
        fotoProfileUrl: json["foto_profile_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
        riders: json["riders"] == null
            ? []
            : List<Rider>.from(json["riders"]!.map((x) => Rider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama_mama": namaMama,
        "telp_mama": telpMama,
        "nama_papa": namaPapa,
        "telp_papa": telpPapa,
        "file_kk_url": fileKkUrl,
        "file_akte_url": fileAkteUrl,
        "file_kia_url": fileKiaUrl,
        "alamat": alamat,
        "foto_profile_url": fotoProfileUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "riders": riders == null
            ? []
            : List<dynamic>.from(riders!.map((x) => x.toJson())),
      };
}

class MembershipData {
  int? id;
  String? kategoriPembayaran;
  String? judulMember;
  String? harga;
  String? syaratKetentuan;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isPurchased;

  MembershipData({
    this.id,
    this.kategoriPembayaran,
    this.judulMember,
    this.harga,
    this.syaratKetentuan,
    this.createdAt,
    this.updatedAt,
    this.isPurchased,
  });

  MembershipData copyWith({
    int? id,
    String? kategoriPembayaran,
    String? judulMember,
    String? harga,
    String? syaratKetentuan,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPurchased,
  }) =>
      MembershipData(
        id: id ?? this.id,
        kategoriPembayaran: kategoriPembayaran ?? this.kategoriPembayaran,
        judulMember: judulMember ?? this.judulMember,
        harga: harga ?? this.harga,
        syaratKetentuan: syaratKetentuan ?? this.syaratKetentuan,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isPurchased: isPurchased ?? this.isPurchased,
      );

  factory MembershipData.fromJson(Map<String, dynamic> json) => MembershipData(
        id: json["id"],
        kategoriPembayaran: json["kategori_pembayaran"],
        judulMember: json["judul_member"],
        harga: json["harga"],
        syaratKetentuan: json["syarat_ketentuan"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
        isPurchased: json["is_purchased"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_pembayaran": kategoriPembayaran,
        "judul_member": judulMember,
        "harga": harga,
        "syarat_ketentuan": syaratKetentuan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_purchased": isPurchased,
      };

  num get hargaNum => num.tryParse(harga ?? '0') ?? 0;
}

class Rider {
  int? id;
  int? waliId;
  String? namaLengkap;
  String? panggilan;
  String? julukan;
  DateTime? tanggalLahir;
  String? domisili;
  int? tinggiBadan;
  int? panjangKaki;
  int? panjangLengan;
  int? lingkarKepala;
  String? ukuranSepatu;
  String? nomorPlat;
  String? warnaOfficial;
  String? fotoRiderUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? gender;
  int? totalPoints;
  Level? level;
  MembershipData? membership;

  Rider({
    this.id,
    this.waliId,
    this.namaLengkap,
    this.panggilan,
    this.julukan,
    this.tanggalLahir,
    this.domisili,
    this.tinggiBadan,
    this.panjangKaki,
    this.panjangLengan,
    this.lingkarKepala,
    this.ukuranSepatu,
    this.nomorPlat,
    this.warnaOfficial,
    this.fotoRiderUrl,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.totalPoints,
    this.level,
    this.membership,
  });

  Rider copyWith({
    int? id,
    int? waliId,
    String? namaLengkap,
    String? panggilan,
    String? julukan,
    DateTime? tanggalLahir,
    String? domisili,
    int? tinggiBadan,
    int? panjangKaki,
    int? panjangLengan,
    int? lingkarKepala,
    String? ukuranSepatu,
    String? nomorPlat,
    String? warnaOfficial,
    String? fotoRiderUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? gender,
    int? totalPoints,
    Level? level,
    MembershipData? membership,
  }) =>
      Rider(
        id: id ?? this.id,
        waliId: waliId ?? this.waliId,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        panggilan: panggilan ?? this.panggilan,
        julukan: julukan ?? this.julukan,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        domisili: domisili ?? this.domisili,
        tinggiBadan: tinggiBadan ?? this.tinggiBadan,
        panjangKaki: panjangKaki ?? this.panjangKaki,
        panjangLengan: panjangLengan ?? this.panjangLengan,
        lingkarKepala: lingkarKepala ?? this.lingkarKepala,
        ukuranSepatu: ukuranSepatu ?? this.ukuranSepatu,
        nomorPlat: nomorPlat ?? this.nomorPlat,
        warnaOfficial: warnaOfficial ?? this.warnaOfficial,
        fotoRiderUrl: fotoRiderUrl ?? this.fotoRiderUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        gender: gender ?? this.gender,
        totalPoints: totalPoints ?? this.totalPoints,
        level: level ?? this.level,
        membership: membership ?? this.membership,
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
        domisili: json["domisili"],
        tinggiBadan: json["tinggi_badan"],
        panjangKaki: json["panjang_kaki"],
        panjangLengan: json["panjang_lengan"],
        lingkarKepala: json["lingkar_kepala"],
        ukuranSepatu: json["ukuran_sepatu"],
        nomorPlat: json["nomor_plat"],
        warnaOfficial: json["warna_official"],
        fotoRiderUrl: json["foto_rider_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        totalPoints: json["total_points"],
        level: json["level"] == null ? null : Level.fromJson(json["level"]),
        membership: json["membership"] == null
            ? null
            : MembershipData.fromJson(json["membership"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "wali_id": waliId,
        "nama_lengkap": namaLengkap,
        "panggilan": panggilan,
        "julukan": julukan,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "domisili": domisili,
        "tinggi_badan": tinggiBadan,
        "panjang_kaki": panjangKaki,
        "panjang_lengan": panjangLengan,
        "lingkar_kepala": lingkarKepala,
        "ukuran_sepatu": ukuranSepatu,
        "nomor_plat": nomorPlat,
        "warna_official": warnaOfficial,
        "foto_rider_url": fotoRiderUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "total_points": totalPoints,
        "level": level?.toJson(),
        "membership": membership?.toJson(),
      };
}

class Level {
  int? id;
  String? nama;
  int? minimalPoin;
  int? maksimalPoin;
  String? iconUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  Level({
    this.id,
    this.nama,
    this.minimalPoin,
    this.maksimalPoin,
    this.iconUrl,
    this.createdAt,
    this.updatedAt,
  });

  Level copyWith({
    int? id,
    String? nama,
    int? minimalPoin,
    int? maksimalPoin,
    String? iconUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Level(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        minimalPoin: minimalPoin ?? this.minimalPoin,
        maksimalPoin: maksimalPoin ?? this.maksimalPoin,
        iconUrl: iconUrl ?? this.iconUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        nama: json["nama"],
        minimalPoin: json["minimal_poin"],
        maksimalPoin: json["maksimal_poin"],
        iconUrl: json["icon_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "minimal_poin": minimalPoin,
        "maksimal_poin": maksimalPoin,
        "icon_url": iconUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
