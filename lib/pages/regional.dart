import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/resources/network_helper.dart';
import '../widgets/my_drawer.dart';

class Regional extends StatefulWidget {
  const Regional({Key? key}) : super(key: key);

  @override
  State<Regional> createState() => _RegionalState();
}

const cDataLink =
    "https://disease.sh/v3/covid-19/countries?yesterday=true&sort=active";

class _RegionalState extends State<Regional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Regional"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
          elevation: 2.5,
        ),
        drawer: const MyDrawer(),
        body: Scrollbar(
          child: FutureBuilder(
            future: NetworkHelper(parseThis: cDataLink).getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              final info = snapshot.data;
              return snapshot.data == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.teal,
                    ))
                  : ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return CountryTile(
                          index: index,
                          info: info,
                        );
                      },
                    );
            },
          ),
        ));
  }
}

class CountryTile extends StatelessWidget {
  final info, index;

  const CountryTile({Key? key, required this.info, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.teal[900],
      elevation: 2.5,
      color: Colors.blueGrey[600],
      child: Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Image.network(
              info[index]['countryInfo']['flag'],
              height: 50,
              width: 60,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info[index]['country'],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'active cases : ${info[index]['active'].toString()}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text('today\'s cases : ${info[index]['todayCases'].toString()}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
