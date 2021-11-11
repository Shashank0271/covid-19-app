import 'package:flutter/material.dart';

class SVlist extends StatelessWidget {
  final List? data;
  const SVlist({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 2.5,
      ),
      body: ListView.builder(
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: Colors.teal[900],
              elevation: 2.5,
              color: Colors.blueGrey[600],
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //TODO : style text
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(data![index]['name'] + "\n"),
                    Text(
                      data![index]['address'] +
                          "\n\nTimings :" +
                          data![index]['from'].substring(0, 5) +
                          "-" +
                          data![index]['to'].substring(0, 5),
                    ),
                    Text('Fee :' + data![index]['fee']),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.tealAccent.shade700)),
              ),
            );
          }),
    );
  }
}
