import 'package:flutter/material.dart';
import 'package:covid_tracker/network_helper.dart';

class Regional extends StatefulWidget {
  const Regional({Key? key}) : super(key: key);

  @override
  State<Regional> createState() => _RegionalState();
}

const cDataLink =
    "https://disease.sh/v3/covid-19/countries?yesterday=true&sort=cases";

class _RegionalState extends State<Regional> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: NetworkHelper(parseThis: cDataLink).getData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        final info = snapshot.data;
        return snapshot.data == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(info[index]['country']),
                  );
                },
              );
      },
    ));
  }
}
