// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StatCovid statCovidFromJson(String str) => StatCovid.fromJson(json.decode(str));

String statCovidToJson(StatCovid data) => json.encode(data.toJson());

class StatCovid {
  StatCovid({
    required this.updateDate,
    required this.devBy,
    required this.data,
  });

  String updateDate;
  String devBy;
  List<StatCovidDate> data;

  factory StatCovid.fromJson(Map<String, dynamic> json) => StatCovid(
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

class StatCovidDate {
  StatCovidDate(
      {required this.date,
      required this.newConfirmed,
      required this.newRecovered,
      required this.newHospitalized,
      required this.newDeaths,
      required this.confirmed,
      required this.recovered,
      required this.hospitalized,
      required this.deaths,
      this.updateDate});

  String? date;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  String? updateDate;

  factory StatCovidDate.fromJson(Map<String, dynamic> json) => StatCovidDate(
      date: json["Date"],
      newConfirmed: json["NewConfirmed"],
      newRecovered: json["NewRecovered"],
      newHospitalized: json["NewHospitalized"],
      newDeaths: json["NewDeaths"],
      confirmed: json["Confirmed"],
      recovered: json["Recovered"],
      hospitalized: json["Hospitalized"],
      deaths: json["Deaths"],
      updateDate: json["UpdateDate"]);

  Map<String, dynamic> toJson() => {
        "Date": date,
        "NewConfirmed": newConfirmed,
        "NewRecovered": newRecovered,
        "NewHospitalized": newHospitalized,
        "NewDeaths": newDeaths,
        "Confirmed": confirmed,
        "Recovered": recovered,
        "Hospitalized": hospitalized,
        "Deaths": deaths,
        "UpdateDate": updateDate
      };
}
