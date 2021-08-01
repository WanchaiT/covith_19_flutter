import 'dart:io';

import 'package:covith_19/models/stat_date.dart';
import 'package:covith_19/models/stat_timeline.dart';
import 'package:covith_19/service/api.dart';
import 'package:covith_19/widgets/card.dart';
import 'package:covith_19/widgets/kanit/index.dart';
import 'package:covith_19/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  StatCovidDate? statCovidToday;
  late Map<String, dynamic> response;
  late bool isLoading;

  @override
  void initState() {
    getStatToday();
    onShowLoading();
  }

  onShowLoading() {
    EasyLoading.show(status: 'loading..');
    setStatLoading(true);
  }

  onDismissLoading() {
    EasyLoading.dismiss();
    setStatLoading(false);
  }

  setStatLoading(value) {
    setState(() {
      isLoading = value;
    });
  }

  getStatToday() async {
    response = await StatProvider.getStatToday(onSuccess: (response) {
      print('onSuccess ${response}');
      setState(() {
        statCovidToday = response;
        if (statCovidToday != null) {
          onDismissLoading();
        }
      });
    }, onError: (response, statusCode) {
      print('onError ${response}');
      onDismissLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    // EasyLoading.addStatusCallback((status) {
    //   print('EasyLoading Status $status');
    // });
    return CustomPage(
      child: isLoading == false
          ? statCovidToday != null
              ? _ConstainerHome(
                  statCovidToday: statCovidToday,
                )
              : _CardError(errorMessage: response['statusCode'].toString())
          : Container(),
    );
  }
}

class _ConstainerHome extends StatelessWidget {
  final StatCovidDate? statCovidToday;
  final formatter = NumberFormat("#,###");

  _ConstainerHome({
    this.statCovidToday,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: statCovidToday != null
          ? Column(
              children: [
                CustomCard(
                  margin: const EdgeInsets.all(12),
                  color: Colors.red,
                  content: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Kanit(
                            'ผู้ติดเชื้อเพิ่มวันนี้',
                            style: KanitStyle.h6,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 35),
                        child: Kanit(
                          '+${formatter.format(statCovidToday!.newConfirmed)}',

                          // statCovidToday!.newConfirmed.toString(),
                          style: KanitStyle.h1,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: CustomCard(
                          color: Color(0xff860000),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  Kanit(
                                    'ผู้ป่วยสะสม',
                                    style: KanitStyle.body2,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Kanit(
                                formatter.format(statCovidToday!.confirmed),
                                style: KanitStyle.h4,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: CustomCard(
                              color: const Color(0xff443344),
                              margin: const EdgeInsets.only(right: 6),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Kanit(
                                    'ผู้เสียชีวิตเพิ่มวันนี้',
                                    style: KanitStyle.body2,
                                    color: Colors.white,
                                  ),
                                  Kanit(
                                    '+${formatter.format(statCovidToday!.newDeaths)}',
                                    style: KanitStyle.h5,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: CustomCard(
                              margin: const EdgeInsets.only(left: 6),
                              color: const Color(0xff2B2424),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Kanit(
                                    'ผู้เสียชีวิตสะสม',
                                    style: KanitStyle.body2,
                                    color: Colors.white,
                                  ),
                                  Kanit(
                                    formatter.format(statCovidToday!.deaths),
                                    style: KanitStyle.h5,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: CustomCard(
                              color: Colors.green,
                              // color: const Color(0xff98CB76),
                              margin: const EdgeInsets.only(right: 6),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Kanit(
                                    'หายป่วยเพิ่มเติม',
                                    style: KanitStyle.body2,
                                    color: Colors.white,
                                  ),
                                  Kanit(
                                    '+${formatter.format(statCovidToday!.newRecovered)}',
                                    style: KanitStyle.h5,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: CustomCard(
                              margin: const EdgeInsets.only(left: 6),
                              color: Colors.lightGreen,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Kanit(
                                    'หายป่วยสะสม',
                                    style: KanitStyle.body2,
                                    color: Colors.white,
                                  ),
                                  Kanit(
                                    formatter.format(statCovidToday!.recovered),
                                    style: KanitStyle.h5,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Kanit(
                            'ข้อมูลวันที่ ${statCovidToday!.updateDate}',
                            style: KanitStyle.caption,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}

class _CardError extends StatelessWidget {
  final String? errorMessage;

  const _CardError({Key? key, this.errorMessage = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: CustomCard(
        color: Colors.grey,
        content: Text(errorMessage!),
      ),
    );
  }
}
