import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Grid4(),
  ));
}

class Grid4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid 4"),
        ),
        body: GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            childrenDelegate: SliverChildListDelegate(
                [
                ],
            ))
      //SliverChildBuilderDelegate(
      //     (ctx,index){
      //       return Card(
      //         child: Text("jhgxfz"),
      //       );
      //     }
      // ))
    );
  }
}
