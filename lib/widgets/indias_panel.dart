import 'package:flutter/material.dart';

class IndiaPanel extends StatelessWidget {
  final String? activeCases;
  final String? todayCases;
  final String? todayDeaths;
  final String? todayRecovered;
  const IndiaPanel(
      {@required this.todayCases,
      @required this.todayDeaths,
      @required this.activeCases,
      @required this.todayRecovered});

  TextStyle applyStyle(double size) => TextStyle(
        fontSize: size,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Dongle',
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, bottom: 3),
        child: Column(
          children: [
            Text(
              "Cases in India",
              style: applyStyle(30),
            ),

            /// #1 active cases
            SizedBox(
              width: double.infinity,
              child: Text(
                'Active cases : $activeCases',
                style: applyStyle(21),
                textAlign: TextAlign.start,
              ),
            ),

            /// #2 today's cases
            SizedBox(
              width: double.infinity,
              child: Text(
                'Today\'s cases : $todayCases',
                style: applyStyle(21),
                textAlign: TextAlign.start,
              ),
            ),

            /// #3 today's deaths
            SizedBox(
              width: double.infinity,
              child: Text(
                'Today\'s deaths: $todayDeaths',
                style: applyStyle(21),
                textAlign: TextAlign.start,
              ),
            ),

            /// #4 today's recoveries
            SizedBox(
              width: double.infinity,
              child: Text(
                'Today\'s recoveries: $todayRecovered',
                style: applyStyle(21),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: Colors.blueGrey,
        border: Border.all(color: Colors.tealAccent, width: 2),
      ),
    );
  }
}
