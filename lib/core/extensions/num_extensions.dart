import 'package:intl/intl.dart';

extension NumExtension on num {
  // toRupiah()
  String toRupiah() {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(this);
  }
}
