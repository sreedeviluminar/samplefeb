import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Grid4(),
  ));
}

class Grid4 extends StatelessWidget {

  var images = [
    "assets/icons/logingirl.png",
    "assets/icons/logingirl.png",
    "assets/icons/orange.png",
    "assets/icons/apple.png",
    "assets/icons/orange.png",
    "assets/icons/bananas.png",
    "assets/icons/grapes.png",
    "assets/icons/mango.png",
    "assets/icons/apple.png",
    "assets/icons/logingirl.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid 4"),
        ),
        body: GridView.custom(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            childrenDelegate: SliverChildBuilderDelegate((ctx, index) {
              return  Card(
                child: Image(
                  image: AssetImage(images[index]),
                ),
              );
            }, childCount: 10))

        //SliverChildListDelegate(
        //     [
        //       const Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        //       const Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        //       const Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        //       const Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        //       const Card(child: Center(child: Icon(Icons.ac_unit,size: 30,),),),
        //     ])
        // )
        );
  }
}
