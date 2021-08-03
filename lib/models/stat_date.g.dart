// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatCovidDate _$StatCovidDateFromJson(Map<String, dynamic> json) {
  return StatCovidDate(
    date: json['Date'] as String?,
    newConfirmed: json['NewConfirmed'] as int,
    newRecovered: json['NewRecovered'] as int,
    newHospitalized: json['NewHospitalized'] as int,
    newDeaths: json['NewDeaths'] as int,
    confirmed: json['Confirmed'] as int,
    recovered: json['Recovered'] as int,
    hospitalized: json['Hospitalized'] as int,
    deaths: json['Deaths'] as int,
    updateDate: json['UpdateDate'] as String?,
  );
}

Map<String, dynamic> _$StatCovidDateToJson(StatCovidDate instance) =>
    <String, dynamic>{
      'Date': instance.date,
      'NewConfirmed': instance.newConfirmed,
      'NewRecovered': instance.newRecovered,
      'NewHospitalized': instance.newHospitalized,
      'NewDeaths': instance.newDeaths,
      'Confirmed': instance.confirmed,
      'Recovered': instance.recovered,
      'Hospitalized': instance.hospitalized,
      'Deaths': instance.deaths,
      'UpdateDate': instance.updateDate,
    };
