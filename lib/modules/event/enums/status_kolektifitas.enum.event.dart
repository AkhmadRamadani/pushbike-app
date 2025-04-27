import 'package:flutter/material.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

enum StatusKolektifitasEnumEvent {
  mandiri,
  kolektif,
  internal,
}

extension StatusKolektifitasEnumEventExtension on StatusKolektifitasEnumEvent {
  String get value {
    switch (this) {
      case StatusKolektifitasEnumEvent.mandiri:
        return 'mandiri';
      case StatusKolektifitasEnumEvent.kolektif:
        return 'kolektif';
      case StatusKolektifitasEnumEvent.internal:
        return 'internal';
    }
  }

  String get labelShort {
    switch (this) {
      case StatusKolektifitasEnumEvent.mandiri:
        return 'Mandiri';
      case StatusKolektifitasEnumEvent.kolektif:
        return 'Kolektif';
      case StatusKolektifitasEnumEvent.internal:
        return 'Internal';
    }
  }

  String get label {
    switch (this) {
      case StatusKolektifitasEnumEvent.mandiri:
        return 'Pendaftaran Mandiri';
      case StatusKolektifitasEnumEvent.kolektif:
        return 'Pendaftaran Kolektif';
      case StatusKolektifitasEnumEvent.internal:
        return 'Internal';
    }
  }

  Color get color {
    switch (this) {
      case StatusKolektifitasEnumEvent.mandiri:
        return ColorConst.dangerSurface;
      case StatusKolektifitasEnumEvent.kolektif:
        return ColorConst.successBorder;
      case StatusKolektifitasEnumEvent.internal:
        return const Color(0xff21E8E5);
    }
  }

  Color get textColor {
    switch (this) {
      case StatusKolektifitasEnumEvent.mandiri:
        return Colors.white;
      case StatusKolektifitasEnumEvent.kolektif:
        return Colors.white;
      case StatusKolektifitasEnumEvent.internal:
        return ColorConst.textColour80;
    }
  }
}
