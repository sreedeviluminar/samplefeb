import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      useInheritedMediaQuery: true,
      home: Expnd(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class Expnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellowAccent),
              ),
              Expanded(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                ),
              ),
              Expanded(
                child: Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
