import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'network_helper.dart';

void main() {
  runApp(const MyApp());
}

const worldWideLink = "https://disease.sh/v3/covid-19/all";

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
  NetworkHelper? networkHelper;
  Map? decodedStuff;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkHelper = NetworkHelper(parseThis: worldWideLink);
    getResponse();
  }

  void getResponse() async {
    decodedStuff = await networkHelper!.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const SizedBox(height: 20),
            const DrawerHeader(child: Text("INSERT IMAGE HERE")),
            const SizedBox(height: 12),
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
      body: decodedStuff == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          decodedStuff = null;
                          getResponse();
                        });
                      },
                      child: const Text("refresh"),
                      style: ElevatedButton.styleFrom(
                        elevation: 3.5,
                        primary: Colors.blueGrey,
                      )),
                ],
              ),
            ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final String? panelTitle;
  final String? displayCount;
  const StatusPanel({Key? key, this.panelTitle, this.displayCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: Colors.blueGrey,
          border: Border.all(color: Colors.tealAccent, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              panelTitle!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(displayCount!,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
