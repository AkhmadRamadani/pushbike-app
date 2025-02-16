import 'package:isar/isar.dart';
import 'package:pushbike_app/modules/authentication/models/responses/user_data.response.model.dart';

part 'local_user_data.g.dart';

@collection
class LocalUserData {
  Id? localId;
  int? userId;
  String? name;
  String? email;
  String? role;
  String? token; // Example: If a token is stored locally.

  LocalWali? wali;

  LocalKomunitas? komunitas;

  LocalRider? selectedRider;

  LocalRiderMembership? membership;

  LocalUserData({
    this.localId,
    this.userId,
    this.name,
    this.email,
    this.role,
    this.token,
    this.wali,
    this.komunitas,
    this.selectedRider,
    this.membership,
  });

  factory LocalUserData.fromUserDataResponseModel(
    UserDataResponseModel user, {
    LocalRider? selectedRider,
    LocalRiderMembership? membership,
    String? token,
  }) {
    return LocalUserData(
      localId: 1,
      userId: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
      token: token, // Adjust if token is a property.
      wali: user.wali != null ? LocalWali.fromWali(user.wali!) : null,
      komunitas: user.komunitas != null
          ? LocalKomunitas.fromKomunitas(user.komunitas!)
          : null,
      selectedRider: selectedRider,
      membership: membership,
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "role": role,
        "token": token,
        "wali": wali?.toJson(),
        "komunitas": komunitas?.toJson(),
        "selectedRider": selectedRider?.toJson(),
        "membership": membership?.toJson(),
      };
}

@embedded
class LocalWali {
  String? namaMama;
  String? namaPapa;
  String? telpMama;
  String? telpPapa;

  LocalWali({
    this.namaMama,
    this.namaPapa,
    this.telpMama,
    this.telpPapa,
  });

  factory LocalWali.fromWali(Wali wali) {
    return LocalWali(
      namaMama: wali.namaMama,
      namaPapa: wali.namaPapa,
      telpMama: wali.telpMama,
      telpPapa: wali.telpPapa,
    );
  }

  Map<String, dynamic> toJson() => {
        "namaMama": namaMama,
        "namaPapa": namaPapa,
        "telpMama": telpMama,
        "telpPapa": telpPapa,
      };
}

@embedded
class LocalKomunitas {
  int? komunitasId;
  String? namaKomunitas;
  String? warnaBg;
  String? logo;

  LocalKomunitas({
    this.komunitasId,
    this.namaKomunitas,
    this.warnaBg,
    this.logo,
  });

  factory LocalKomunitas.fromKomunitas(Komunitas komunitas) {
    return LocalKomunitas(
      komunitasId: komunitas.id,
      namaKomunitas: komunitas.nama,
      warnaBg: komunitas.warnaBg,
      logo: komunitas.logo,
    );
  }

  Map<String, dynamic> toJson() => {
        "komunitasId": komunitasId,
        "namaKomunitas": namaKomunitas,
        "warnaBg": warnaBg,
        "logo": logo,
      };
}

@embedded
class LocalRider {
  int? riderId;
  String? namaLengkap;
  String? panggilan;
  String? julukan;
  int? gender;
  DateTime? tanggalLahir;
  int? totalPoints;

  LocalRiderLevel? level;

  LocalRider({
    this.riderId,
    this.namaLengkap,
    this.panggilan,
    this.julukan,
    this.gender,
    this.tanggalLahir,
    this.totalPoints,
    this.level,
  });

  factory LocalRider.fromRider(Rider rider) {
    return LocalRider(
      riderId: rider.id,
      namaLengkap: rider.namaLengkap,
      panggilan: rider.panggilan,
      julukan: rider.julukan,
      gender: rider.gender,
      tanggalLahir: rider.tanggalLahir,
      totalPoints: rider.totalPoints,
      level:
          rider.level != null ? LocalRiderLevel.fromLevel(rider.level!) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "riderId": riderId,
        "namaLengkap": namaLengkap,
        "panggilan": panggilan,
        "julukan": julukan,
        "gender": gender,
        "totalPoints": totalPoints,
        "tanggalLahir": tanggalLahir,
      };
}

@embedded
class LocalRiderLevel {
  int? levelId;
  String? nama;
  int? minimalPoin;
  int? maksimalPoin;
  String? icon;

  LocalRiderLevel({
    this.levelId,
    this.nama,
    this.minimalPoin,
    this.maksimalPoin,
    this.icon,
  });

  factory LocalRiderLevel.fromLevel(Level level) => LocalRiderLevel(
        levelId: level.id,
        nama: level.nama,
        minimalPoin: level.minimalPoin,
        maksimalPoin: level.maksimalPoin,
        icon: level.icon,
      );

  Map<String, dynamic> toJson() => {
        "id": levelId,
        "nama": nama,
        "minimal_poin": minimalPoin,
        "maksimal_poin": maksimalPoin,
        "icon": icon,
      };
}

@embedded
class LocalRiderMembership {
  int? membershipId;
  String? kategoriPembayaran;
  String? judulMember;
  String? harga;
  String? syaratKetentuan;

  LocalRiderMembership({
    this.membershipId,
    this.kategoriPembayaran,
    this.judulMember,
    this.harga,
    this.syaratKetentuan,
  });

  factory LocalRiderMembership.fromMembership(MembershipData membership) {
    return LocalRiderMembership(
      membershipId: membership.id,
      kategoriPembayaran: membership.kategoriPembayaran,
      judulMember: membership.judulMember,
      harga: membership.harga,
      syaratKetentuan: membership.syaratKetentuan,
    );
  }

  Map<String, dynamic> toJson() => {
        "membershipId": membershipId,
        "kategoriPembayaran": kategoriPembayaran,
        "judulMember": judulMember,
        "harga": harga,
        "syaratKetentuan": syaratKetentuan,
      };

  // harga to num
  num get hargaNum => num.tryParse(harga ?? '0') ?? 0;
}
