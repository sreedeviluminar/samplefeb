import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      useInheritedMediaQuery: true,
      home: Grid5(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class Grid5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
          maxCrossAxisExtent: 120,
      children: const [
              Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
              Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
              Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
              Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
              Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
            ])
    );
  }
}
