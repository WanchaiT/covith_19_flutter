import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'stat_date.g.dart';

@JsonSerializable()
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

  @JsonKey(name: 'Date')
  String? date;
  @JsonKey(name: 'NewConfirmed')
  int newConfirmed;
  @JsonKey(name: 'NewRecovered')
  int newRecovered;
  @JsonKey(name: 'NewHospitalized')
  int newHospitalized;
  @JsonKey(name: 'NewDeaths')
  int newDeaths;
  @JsonKey(name: 'Confirmed')
  int confirmed;
  @JsonKey(name: 'Recovered')
  int recovered;
  @JsonKey(name: 'Hospitalized')
  int hospitalized;
  @JsonKey(name: 'Deaths')
  int deaths;
  @JsonKey(name: 'UpdateDate')
  String? updateDate;

  factory StatCovidDate.fromJson(Map<String, dynamic> json) =>
      _$StatCovidDateFromJson(json);
  Map<String, dynamic> toJson() => _$StatCovidDateToJson(this);
}
