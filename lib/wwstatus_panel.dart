import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Text(
              displayCount!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
