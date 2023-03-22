import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: List_Separator(),
  ));
}

class List_Separator extends StatelessWidget {
  var data = [
    "data1",
    "data2",
    "data3",
    "data4",
    "data5",
    "data6",
    "data7",
    "data8",
    "data9"
  ];
  var sepdata = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7",
    "item8",
    "item9"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Separator"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/rain.jpg"
                ))),
        child: ListView.separated(
            itemBuilder: (ctx, index) {
              return Card(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(data[index]),
              ));
            },
            separatorBuilder: (ctx, index) {
              return Center(child: Text(sepdata[index],style: TextStyle(color: Colors.white),));
            },
            itemCount: data.length),
      ),
    );
  }
}
