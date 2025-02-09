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

  static const String doctorSchedule = "doctor/schedule";
  static const String doctorMySchedule = "doctor/my_schedule";
  static const String scheduleCreate = "doctor/schedule/create";
  static const String scheduleUpdate = "doctor/schedule/update";
  static const String scheduleDelete = "doctor/schedule/delete";
  static const String doctorAll = "doctor/all";
  static const String doctorPlaces = "doctor/places/";
  static const String reservationTodayTotal = "reservation/today_total";
  static const String reservationBook = "reservation/book";
  static const String reservationDetail = "reservation/detail/";
  static const String reservationQuota = "reservation/quota/";

  /// Get my reservation
  /// params: patient_id
  /// reservation/my?patient_id=1
  static const String reservationMy = "reservation/my";

  /// /api/reservation/all?limit=5&page=1
  static const String reservationAll = "reservation/all";
  static const String reservationApprove = "reservation/approve";

  static const String announcementAll = "announcement/all";
  static const String announcementCreate = "announcement/create";
  static const String announcementUpdate = "announcement/update";
  static const String announcementDelete = "announcement/delete";

  // /medical_record/icds?search=Arthrodesis
  static const String medicalRecordIcds = "medical_record/icds";
  static const String medicalRecordAdd = "medical_record/add";
  // medical_record/my?patient_id=1&limit=3
  static const String medicalRecordMy = "medical_record/my";

  static const String patientAll = "patient/all";
  static const String patientUpdateAccessCode = "patient/update_access_code";

  // /notification/all
  static const String notificationAll = "notification/all";
  static const String notificationRead = "notification/read";

  // places
  static const String placesMy = "place/my";
  static const String placesCreate = "place/create";
  static const String placesUpdate = "place/update";
  static const String placesDelete = "place/delete";
}
