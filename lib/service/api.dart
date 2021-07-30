import 'package:covith_19/models/stat_covid.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

Future<StatCovid?> getStatTimeline() async {
  const url = 'https://covid19.th-stat.com/json/covid19v2/getTimeline.json';
  StatCovid? statCovid;
  try {
    Response response = await Dio().get(
      url,
    );

    statCovid = statCovidFromJson(response.toString());
  } catch (e) {
    print(e);
  }
  return statCovid;
}

Future<StatCovidDate?> getStatToday() async {
  const url = 'https://covid19.th-stat.com/json/covid19v2/getTodayCases.json';
  StatCovidDate? statCovid;
  try {
    Response response = await Dio().get(
      url,
    );
    print(response);

    statCovid = StatCovidDate.fromJson(json.decode(response.toString()));
    print(response);
  } catch (e) {
    print('dfffå');
    print(e);
  }
  return statCovid;
}
