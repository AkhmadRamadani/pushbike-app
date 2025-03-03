// create a date extension to convert string to date and vice versa
import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get locale => 'id_ID';

  String toDateString() {
    return DateFormat('yyyy-MM-dd', locale).format(this);
  }

  String toTimeString() {
    return DateFormat('HH:mm:ss', locale).format(this);
  }

  String toDateTimeString() {
    return DateFormat('yyyy-MM-dd HH:mm:ss', locale).format(this);
  }

  String toHumanReadableDateString() {
    return DateFormat('EEEE, dd MMMM yyyy', locale).format(this);
  }
  String toHumanReadableDateStringMonthShort() {
    return DateFormat('EEEE, dd MMM yyyy', locale).format(this);
  }

  String toHHMMString() {
    return DateFormat('HH:mm', locale).format(this);
  }

  String extToFormattedString({String outputDateFormat = 'yyyy-MM-dd'}) {
    return DateFormat(outputDateFormat, locale).format(this);
  }

  String toMonthYearString() {
    return DateFormat('MMM yyyy', locale).format(this);
  }

  String toReadableMonth(){
    return DateFormat('MMMM', locale).format(this);
  }

  int getLastDayOfMonth() {
    return DateTime(year, month + 1, 0).day;
  }


  String toDayMonthYearString() {
    return DateFormat('dd MMM yyyy', locale).format(this);
  }

  // 01 Okt 2024, 15:10
  String toDayMonthYearHourMinuteString() {
    return DateFormat('dd MMM yyyy, HH:mm', locale).format(this);
  }

  int getAge() {
    var now = DateTime.now();
    var age = now.year - year;
    if (now.month < month) {
      age--;
    } else if (now.month == month) {
      if (now.day < day) {
        age--;
      }
    }
    return age;
  }

  String getHumanDifferentTime() {
    var now = DateTime.now();
    var diff = now.difference(this);
    if (diff.inDays > 0) {
      return '${diff.inDays} hari yang lalu';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} jam yang lalu';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} menit yang lalu';
    } else if (diff.inSeconds > 0) {
      return '${diff.inSeconds} detik yang lalu';
    } else {
      return 'Baru saja';
    }
  }
}
