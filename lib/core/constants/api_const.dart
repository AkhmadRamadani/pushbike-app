class ApiConst {
  ApiConst._();
  static const String baseUrl = "http://192.168.0.179:8000/api/";

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
}
