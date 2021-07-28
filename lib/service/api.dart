import 'package:covith_19/module/stat_covid.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

Future<StatCovid?> getStatCovid19Th() async {
  const url = 'https://covid19.th-stat.com/json/covid19v2/getTimeline.json';
  StatCovid? statCovid;
  try {
    Response response = await Dio().get(
      url,
    );

    statCovid = statCovidFromJson(response.toString());
  } catch (e) {
    print('dd');
    print(e);
  }
  return statCovid;
}
