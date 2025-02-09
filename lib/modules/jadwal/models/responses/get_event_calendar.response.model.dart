// To parse this JSON data, do
//
//     final getCalendarEventResponse = getCalendarEventResponseFromJson(jsonString);

import 'dart:convert';

List<GetCalendarEventResponseModel> getCalendarEventResponseFromJson(
        String str) =>
    List<GetCalendarEventResponseModel>.from(
        json.decode(str).map((x) => GetCalendarEventResponseModel.fromJson(x)));

String getCalendarEventResponseToJson(
        List<GetCalendarEventResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCalendarEventResponseModel {
  List<CalendarEvent>? event;

  GetCalendarEventResponseModel({
    this.event,
  });

  GetCalendarEventResponseModel copyWith({
    List<CalendarEvent>? event,
  }) =>
      GetCalendarEventResponseModel(
        event: event ?? this.event,
      );

  factory GetCalendarEventResponseModel.fromJson(Map<String, dynamic> json) =>
      GetCalendarEventResponseModel(
        event: json["event"] == null
            ? []
            : List<CalendarEvent>.from(
                json["event"]!.map((x) => CalendarEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "event": event == null
            ? []
            : List<dynamic>.from(event!.map((x) => x.toJson())),
      };
}

class CalendarEvent {
  DateTime? date;
  List<DatumEventCalendar>? data;

  CalendarEvent({
    this.date,
    this.data,
  });

  CalendarEvent copyWith({
    DateTime? date,
    List<DatumEventCalendar>? data,
  }) =>
      CalendarEvent(
        date: date ?? this.date,
        data: data ?? this.data,
      );

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => CalendarEvent(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        data: json["data"] == null
            ? []
            : List<DatumEventCalendar>.from(
                json["data"]!.map((x) => DatumEventCalendar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumEventCalendar {
  int? id;
  EventCategory? kategori;
  String? fotoLokasi;
  String? kelas;
  DateTime? tanggal;
  String? waktu;
  String? lokasi;
  String? materi;
  String? pelatih;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumEventCalendar({
    this.id,
    this.kategori,
    this.fotoLokasi,
    this.kelas,
    this.tanggal,
    this.waktu,
    this.lokasi,
    this.materi,
    this.pelatih,
    this.createdAt,
    this.updatedAt,
  });

  DatumEventCalendar copyWith({
    int? id,
    EventCategory? kategori,
    String? fotoLokasi,
    String? kelas,
    DateTime? tanggal,
    String? waktu,
    String? lokasi,
    String? materi,
    String? pelatih,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DatumEventCalendar(
        id: id ?? this.id,
        kategori: kategori ?? this.kategori,
        fotoLokasi: fotoLokasi ?? this.fotoLokasi,
        kelas: kelas ?? this.kelas,
        tanggal: tanggal ?? this.tanggal,
        waktu: waktu ?? this.waktu,
        lokasi: lokasi ?? this.lokasi,
        materi: materi ?? this.materi,
        pelatih: pelatih ?? this.pelatih,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DatumEventCalendar.fromJson(Map<String, dynamic> json) =>
      DatumEventCalendar(
        id: json["id"],
        kategori: EventCategoryExtension.fromJson(json["kategori"]),
        fotoLokasi: json["foto_lokasi"],
        kelas: json["kelas"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.tryParse(json["tanggal"]),
        waktu: json["waktu"],
        lokasi: json["lokasi"],
        materi: json["materi"],
        pelatih: json["pelatih"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori?.toJson(),
        "foto_lokasi": fotoLokasi,
        "kelas": kelas,
        "tanggal": tanggal?.toIso8601String(),
        "waktu": waktu,
        "lokasi": lokasi,
        "materi": materi,
        "pelatih": pelatih,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum EventCategory { latihan, ujian }

extension EventCategoryExtension on EventCategory {
  String toJson() {
    switch (this) {
      case EventCategory.latihan:
        return 'Latihan';
      case EventCategory.ujian:
        return 'Ujian';
    }
  }

  static EventCategory? fromJson(String? value) {
    switch (value) {
      case 'Latihan':
        return EventCategory.latihan;
      case 'Ujian':
        return EventCategory.ujian;
      default:
        return null;
    }
  }
}
