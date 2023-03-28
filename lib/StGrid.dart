import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:samplefeb/CustomWidget.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      useInheritedMediaQuery: true,
      home: StGrid(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class StGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: CustomWidget(
                     bgColor: Colors.red,
                      title: const Text("Hello"),
                      onpress: () {},
                      icon: const Icon(Icons.ac_unit))),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    color: Colors.green,
                  )),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 4,
                  child: Card(
                    color: Colors.yellowAccent,
                  )),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Card(
                    color: Colors.purple,
                  )),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Card(
                    color: Colors.blue,
                  )),
              const StaggeredGridTile.count(
                  crossAxisCellCount: 3,
                  mainAxisCellCount: 2,
                  child: Card(
                    color: Colors.pink,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
