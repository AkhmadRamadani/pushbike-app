import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:pushbike_app/core/constants/color_const.dart';

enum StatusRegisteredEnumEvent { pending, approved, rejected, notRegistered }

extension StatusRegisteredExtension on StatusRegisteredEnumEvent {
  String get value {
    switch (this) {
      case StatusRegisteredEnumEvent.pending:
        return 'pending';
      case StatusRegisteredEnumEvent.approved:
        return 'approved';
      case StatusRegisteredEnumEvent.rejected:
        return 'rejected';
      case StatusRegisteredEnumEvent.notRegistered:
        return 'notRegistered';
    }
  }

  String get label {
    switch (this) {
      case StatusRegisteredEnumEvent.pending:
        return 'Pending';
      case StatusRegisteredEnumEvent.approved:
        return 'Terdaftar';
      case StatusRegisteredEnumEvent.rejected:
        return 'Rejected';
      case StatusRegisteredEnumEvent.notRegistered:
        return 'Not Registered';
    }
  }

  Color get color {
    switch (this) {
      case StatusRegisteredEnumEvent.pending:
        return ColorConst.warningMain;
      case StatusRegisteredEnumEvent.approved:
        return ColorConst.successMain;
      case StatusRegisteredEnumEvent.rejected:
        return ColorConst.dangerMain;
      case StatusRegisteredEnumEvent.notRegistered:
        return ColorConst.blue100;
    }
  }

  String get icon {
    switch (this) {
      case StatusRegisteredEnumEvent.pending:
        return Majesticons.clock;
      case StatusRegisteredEnumEvent.approved:
        return Majesticons.check_circle;
      case StatusRegisteredEnumEvent.rejected:
        return Mdi.close;
      case StatusRegisteredEnumEvent.notRegistered:
        return Mdi.close;
    }
  }
}
