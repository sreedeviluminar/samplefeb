import 'package:flutter/material.dart';
import 'package:samplefeb/Grid3.dart';
import 'package:samplefeb/list%20with%20builder.dart';

void main() {
  runApp(MaterialApp(
      home: MyhoME(),
      routes: {
        'gridpage': (context) => Grid3(),
        'list'    : (context) => List_Builder(),
      }));
}
class MyhoME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('gridpage');
              },
              child: const Text("To Grid3 page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('list');
              },
              child: const Text("To List page"))
      ],
    ),
        ));
  }
}
