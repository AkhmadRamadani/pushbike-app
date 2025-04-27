class ApiConst {
  ApiConst._();
  // 192.168.18.69
  // static const String baseUrl = "http://192.168.18.69:8000/api/";
  // static const String baseUrl = "http://192.168.0.179:8000/api/";
  // 10.10.5.63
  // static const String baseUrl = "http://10.10.5.63:8000/api/";
  // 10.10.4.93
  // static const String baseUrl = "http://10.10.5.148:8000/api/";

  // https://pushbikeonline.com/api
  static const String baseUrl = "https://pushbikeonline.com/api/";

  static const String login = "login";
  static const String register = "register";
  static const String currentLoginUser = "user-data";
  static const String logout = "logout";

  static const String updatePassword = "auth/update_password";
  static const String updateProfile = "auth/update_profile";

  static const String calendarEvent = "jadwal-mobile";
  static const String jadwalUjian = "jadwal-ujian";
  // /pengumuman-mobile
  static String announcement(int id) => "pengumuman-mobile/$id";
  // pengumuman-read
  static const String announcementRead = "pengumuman-read";

  // /level-my
  static const String myLevel = "level-my";

  // membership-mobile
  static const String membership = "membership-mobile";

  static const String historyPembayaran = "get-history-pembayaran";
  static const String getLatestBill = "get-latest-bill";

  static const String pembayaranIndex = "pembayaran-index-mobile";
  // kategori-mobile
  static const String kategoriMobile = "kategori-mobile";

  static const String modulLatihan = "modul-latihan-mobile";
  static const String bayarPembayaran = "bayar-pembayaran";

  static const String riderHistoryPoint = "rider-history-point";
  static const String indexEventMobile = "index-event-mobile";
  static String detailEventMobile(int id) => "/detail-event-mobile/$id";
  static const String ridersCheckpointMobile = "riders-checkpoint-mobile";
  static const String assignCheckpoint = "assign-checkpoint";

  static const String riderJoinedEvent = "rider-joined-event";
  static const String indexHasilRace = "index-race-mobile";
  static const String uploadHasilRace = "upload-race";
  static const String raceRecapRider = "rider-race-record";

  static String updateRiderMobile(int id) => "update-rider-mobile/$id";
  static String updateWaliMobile(int id) => "update-wali-mobile/$id";
  static String updateSepedaMobile(int id) => "update-sepeda-mobile/$id";
  static String dataInitial(int id) => "data-initial/$id";
  static const String registerEventMobile = "register-event-mobile";
  static const String changePassword = "ubah-password";
}
