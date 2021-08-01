// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:covith_19/models/stat_date.dart';

StatTimeline statCovidFromJson(String str) =>
    StatTimeline.fromJson(json.decode(str));

String statCovidToJson(StatTimeline data) => json.encode(data.toJson());

class StatTimeline {
  StatTimeline({
    required this.updateDate,
    required this.devBy,
    required this.data,
  });

  String updateDate;
  String devBy;
  List<StatCovidDate> data;

  factory StatTimeline.fromJson(Map<String, dynamic> json) => StatTimeline(
        updateDate: json["UpdateDate"],
        devBy: json["DevBy"],
        data: List<StatCovidDate>.from(
            json["Data"].map((x) => StatCovidDate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UpdateDate": updateDate,
        "DevBy": devBy,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
