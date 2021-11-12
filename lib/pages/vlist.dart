import 'package:flutter/material.dart';

class SVlist extends StatelessWidget {
  final List? data;

  const SVlist({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Available sessions'),
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 2.5,
      ),
      body: ListView.builder(
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.teal[900],
              elevation: 2.5,
              color: Colors.blueGrey[600],
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data![index]['name'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Dongle',
                          fontSize: 28),
                    ),
                    Text(
                      data![index]['address'] +
                          "\nTimings :" +
                          data![index]['from'].substring(0, 5) +
                          "-" +
                          data![index]['to'].substring(0, 5),
                      style: bodyTextStyle(),
                    ),
                    data![index]['min_age_limit'] == null
                        ? Container()
                        : Text(
                            "min age limit :${data![index]['min_age_limit'].toString()}",
                            style: bodyTextStyle(),
                          ),
                    data![index]['max_age_limit'] == null
                        ? Container()
                        : Text(
                            "max age limit :${data![index]['max_age_limit'].toString()}",
                            style: bodyTextStyle(),
                          ),
                    Text(
                      'Vaccine : ${data![index]['vaccine']}',
                      style: bodyTextStyle(),
                    ),
                    Text(
                      'Fee :' + data![index]['fee'],
                      style: bodyTextStyle(),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.tealAccent.shade700,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

TextStyle bodyTextStyle() {
  return const TextStyle(
      color: Colors.white, fontFamily: 'Dongle', fontSize: 20);
}
