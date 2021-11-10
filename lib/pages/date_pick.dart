import 'package:flutter/material.dart';
import 'package:quiver/time.dart';
import 'package:covid_tracker/widgets/my_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid_tracker/resources/network_helper.dart';

class DatePickPage extends StatefulWidget {
  const DatePickPage({Key? key}) : super(key: key);

  @override
  State<DatePickPage> createState() => _DatePickPageState();
}

const _snackBarDuration = Duration(seconds: 3);

class _DatePickPageState extends State<DatePickPage> {
  DateTime? _dateTime;
  final DateTime _currentTime = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  late String formedDate;
  late var slotResponse;

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
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                        daysInMonth(_currentTime.year,
                                            _currentTime.month)))
                                .then((value) {
                              setState(() {
                                _dateTime = value;
                                formedDate =
                                    '${_dateTime!.day}-${_dateTime!.month}-${_dateTime!.year}';
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.grey,
                            primary: Colors.teal,
                            onPrimary: Colors.grey.shade900,
                          ),
                          child: const Text(
                            'pick a date',
                          ),
                        ),
                        Text(
                          _dateTime == null ? ' ' : formedDate,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: const Icon(
                      FontAwesomeIcons.arrowRight,
                      size: 13,
                    ),
                    label: const Text('Check availability'),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      primary: Colors.teal,
                      onPrimary: Colors.grey.shade900,
                    ),
                    onPressed: () async {
                      if (_textEditingController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Enter pin'),
                          duration: _snackBarDuration,
                        ));
                      } else if (_dateTime == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Pick a date'),
                          duration: _snackBarDuration,
                        ));
                      } else {
                        getResponse();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void getResponse() async {
    String parseThis =
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=${_textEditingController.text}&date=$formedDate";
    NetworkHelper netWorkHelper = NetworkHelper(parseThis: parseThis);
    slotResponse = await netWorkHelper.getData();
    if (slotResponse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Pin'),
          duration: _snackBarDuration,
        ),
      );
    }
  }
}
