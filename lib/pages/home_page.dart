import 'package:flutter/material.dart';
import '../widgets/indias_panel.dart';
import '../resources/network_helper.dart';
import 'package:covid_tracker/widgets/wwstatus_panel.dart';
import 'package:covid_tracker/widgets/my_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const worldWideLink = "https://disease.sh/v3/covid-19/all";
const countryLink =
    "https://disease.sh/v3/covid-19/countries/India?yesterday=true";

class _MyHomePageState extends State<MyHomePage> {
  Map? decodedStuff;
  Map? indiaData;
  @override
  void initState() {
    super.initState();
    getResponse();
  }

  void getResponse() async {
    decodedStuff = await NetworkHelper(parseThis: worldWideLink).getData();
    indiaData = await NetworkHelper(parseThis: countryLink).getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "World Wide Cases",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 2.5,
      ),
      drawer: const MyDrawer(),
      body: decodedStuff == null || indiaData == null
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.teal,
            ))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.5,
                            mainAxisSpacing: 15),
                    children: [
                      StatusPanel(
                        panelTitle: "Active cases",
                        displayCount: decodedStuff!['active'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "Today's deaths",
                        displayCount: decodedStuff!['todayDeaths'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "Cases per million",
                        displayCount:
                            decodedStuff!['casesPerOneMillion'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "Affected countries",
                        displayCount:
                            decodedStuff!['affectedCountries'].toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  IndiaPanel(
                    activeCases: indiaData!['active'].toString(),
                    todayCases: indiaData!['todayCases'].toString(),
                    todayDeaths: indiaData!['todayDeaths'].toString(),
                    todayRecovered: indiaData!['todayRecovered'].toString(),
                  ),
                ],
              ),
            ),
    );
  }
}
