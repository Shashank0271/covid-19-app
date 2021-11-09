import 'package:covid_tracker/main.dart';
import 'package:covid_tracker/regional.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/date_pick.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/cv19Nurse.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.map_rounded),
            title: const Text('World-Wide'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(FontAwesomeIcons.searchLocation),
            title: const Text('Regional'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Regional()));
            },
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(FontAwesomeIcons.fileMedical),
            title: const Text('Check vaccination slot'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DatePickPage()));
            },
          ),
        ],
      ),
    );
  }
}
