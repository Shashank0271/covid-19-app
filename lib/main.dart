import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'indias_panel.dart';
import 'network_helper.dart';
import 'package:covid_tracker/wwstatus_panel.dart';

void main() {
  runApp(const MyApp());
}

const worldWideLink = "https://disease.sh/v3/covid-19/all";
const countryLink =
    "https://disease.sh/v3/covid-19/countries/India?yesterday=true";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map? decodedStuff;
  Map? indiaData;
  @override
  void initState() {
    super.initState();
    getResponse(worldWideLink);
  }

  void getResponse(String toParse) async {
    decodedStuff = await NetworkHelper(parseThis: toParse).getData();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Image(
              image: AssetImage('images/virus.png'),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.map_rounded),
              title: const Text('World-Wide'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(FontAwesomeIcons.searchLocation),
              title: const Text('Regional'),
              onTap: () {},
            )
          ],
        ),
      ),
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
                        panelTitle: "active cases",
                        displayCount: decodedStuff!['active'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "today's deaths",
                        displayCount: decodedStuff!['todayDeaths'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "cases per million",
                        displayCount:
                            decodedStuff!['casesPerOneMillion'].toString(),
                      ),
                      StatusPanel(
                        panelTitle: "affected countries",
                        displayCount:
                            decodedStuff!['affectedCountries'].toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  IndiasPanel(
                    activeCases: indiaData!['active'].toString(),
                    todayCases: indiaData!['todayCases'].toString(),
                    todayDeaths: indiaData!['todayDeaths'].toString(),
                    todayRecovered: indiaData!['todayRecovered'].toString(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        decodedStuff = null;
                        indiaData = null;
                        getResponse(worldWideLink);
                        getResponse(countryLink);
                      });
                    },
                    child: const Text("refresh"),
                    style: ElevatedButton.styleFrom(
                      elevation: 3.5,
                      primary: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
