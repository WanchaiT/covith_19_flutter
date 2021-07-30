import 'package:covith_19/models/stat_covid.dart';
import 'package:covith_19/service/api.dart';
import 'package:covith_19/widgets/card.dart';
import 'package:covith_19/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomPage(
      child: _ConstainerHome(),
    );
  }
}

class _ConstainerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder<StatCovidDate?>(
        future: getStatToday(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            StatCovidDate? statCovidToday = snapshot.data;
            print(statCovidToday!.confirmed);
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCard(
                    content: Text(
                      statCovidToday.newConfirmed.toString(),
                    ),
                    color: Colors.brown,
                  ),
                  CustomCard(
                    content: Text(
                      statCovidToday.newConfirmed.toString(),
                    ),
                  ),
                  CustomCard(
                    content: Text(
                      statCovidToday.newConfirmed.toString(),
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
