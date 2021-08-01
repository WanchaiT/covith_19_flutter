import 'package:covith_19/models/stat_date.dart';
import 'package:covith_19/models/stat_timeline.dart';
import 'package:covith_19/service/client.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class StatProvider {
  static Future<StatTimeline?> getStatTimeline() async {
    const url = 'getTimeline.json';
    try {
      StatTimeline? statCovid;
      var response = await DioClient.dio().get(url);
      statCovid = statCovidFromJson(response.data());
      return Future.value(statCovid);
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Map<String, dynamic>> getStatToday({onSuccess, onError}) async {
    const url = 'getTodayCases.json';
    try {
      StatCovidDate? statCovid;
      var response = await DioClient.dio().get(url);
      statCovid = StatCovidDate.fromJson(json.decode(response.toString()));
      print('in 1');
      onSuccess(statCovid);
      return Map.from({'data': statCovid, 'statusCode': response.statusCode});
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('in 2');
        onError();
        return Map.from({'data': null, 'statusCode': e.response!.statusCode});
        // print(e.response!.data);
        // print(e.response!.headers);
        // print(e.response!.statusCode);
      } else {
        print('in 3');
        onError();

        // Something happened in setting up or sending the request that triggered an Error
        print(e.error);
        print(e.message);
        return Map.from({'data': null, 'error': e.error});
      }
    }
  }
}
