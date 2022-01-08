import 'package:covid_tracker/pages/home_page.dart';
import 'package:covid_tracker/pages/regional.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/pages/date_pick.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      IconData iconData, String titleText, VoidCallback onTapHandler) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(titleText),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blueGrey.withOpacity(0.7), Colors.blueGrey],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        //color: Colors.blueGrey[400],
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
            const SizedBox(height: 20),
            buildListTile(
              Icons.map_rounded,
              'World-wide',
              () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
            ),
            const SizedBox(height: 20),
            buildListTile(
              FontAwesomeIcons.searchLocation,
              'Regional',
              () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Regional()));
              },
            ),
            const SizedBox(height: 20),
            buildListTile(
              FontAwesomeIcons.fileMedical,
              'Check vaccination slot',
              () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DatePickPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
