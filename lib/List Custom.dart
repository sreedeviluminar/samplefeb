import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: List_Custom(),
  ));
}

class List_Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Separator"),
        ),
        body: ListView.custom(
          ///using SliverChildListDelegate
        //     childrenDelegate: SliverChildListDelegate(
        //   [
        //     const Icon(Icons.access_time_filled_outlined),
        //     const Icon(Icons.access_time_filled_outlined),
        //     const Icon(Icons.access_time_filled_outlined),
        //     const Icon(Icons.access_time_filled_outlined),
        //     const Icon(Icons.access_time_filled_outlined),
        //     const Icon(Icons.access_time_filled_outlined),
        //   ],
        // )
        /// using SliverChildBuilderDelegate
          childrenDelegate: SliverChildBuilderDelegate(
              (ctx,index){
                return Card(
                  color: Colors.red[color[index]],
                  child: const Text("HII"),
                );
              },
            childCount: color.length
          ),
        ));
  }
  var color = [800, 600, 400, 300, 100, 50];

}
