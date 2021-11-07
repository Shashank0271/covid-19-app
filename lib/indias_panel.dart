import 'package:flutter/material.dart';

class IndiasPanel extends StatelessWidget {
  final String? activeCases;
  final String? todayCases;
  final String? todayDeaths;
  final String? todayRecovered;
  const IndiasPanel(
      {@required this.activeCases,
      @required this.todayCases,
      @required this.todayDeaths,
      this.todayRecovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Cases in India",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            /// #1 active cases
            SizedBox(
              width: double.infinity,
              child: Text(
                'active cases : $activeCases',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),

            /// #2 today's cases
            SizedBox(
              width: double.infinity,
              child: Text(
                'today\'s cases : $todayCases',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),

            /// #3 today's deaths
            SizedBox(
              width: double.infinity,
              child: Text(
                'today\'s deaths: $todayDeaths',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),

            /// #4 today's recoveries
            SizedBox(
              width: double.infinity,
              child: Text(
                'today\'s recoveries: $todayRecovered',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
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
