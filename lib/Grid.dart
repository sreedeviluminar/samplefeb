import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: GridViewDemo(),));
}
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid 1"),
        ),
        body: GridView(
          gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200
          ),
          children: [
            Card(child: Image.asset("assets/icons/apple.png",height: 50,width: 50,)),
            Image.asset("assets/icons/bananas.png"),
            Image.asset("assets/icons/grapes.png"),
            Image.asset("assets/icons/logingirl.png"),
            Image.asset("assets/icons/mango.png"),
            Image.asset("assets/icons/tent.png")
          ],
        ));
  }
}
