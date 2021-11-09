import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'package:covid_tracker/widgets/my_drawer.dart';

class DatePickPage extends StatefulWidget {
  const DatePickPage({Key? key}) : super(key: key);

  @override
  State<DatePickPage> createState() => _DatePickPageState();
}

class _DatePickPageState extends State<DatePickPage> {
  DateTime? _dateTime;
  final DateTime _currentTime = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  late String formedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Check Slot Vacancy"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
          elevation: 2.5,
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/vaccine.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 12),
                  //TODO : Make a TextField to enter the pin
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _textEditingController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.tealAccent, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.tealAccent, width: 2.0)),
                        labelText: 'Enter Pin',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Text(
                    _dateTime == null
                        ? ' Nothing has been picked yet'
                        : formedDate,
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime ?? _currentTime,
                              firstDate: DateTime(_currentTime.year,
                                  _currentTime.month, _currentTime.day),
                              lastDate: DateTime(
                                  _currentTime.year,
                                  _currentTime.month,
                                  daysInMonth(
                                      _currentTime.year, _currentTime.month)))
                          .then((value) {
                        setState(() {
                          _dateTime = value;
                          formedDate =
                              '${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}';
                        });
                      });
                    },
                    child: const Text(
                      'pick a date',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
