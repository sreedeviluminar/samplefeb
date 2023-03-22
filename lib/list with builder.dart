import 'package:flutter/material.dart';

class List_Builder extends StatelessWidget {
  var name = ["apple", "orange", "grapes", "kiwi", "jackfruit"];
  var images = [
    "assets/icons/apple.png",
    "assets/icons/orange.png",
    "assets/icons/bananas.png",
    "assets/icons/grapes.png",
    "assets/icons/mango.png"
  ];
  var price = [100, 200, 300, 400, 500];
  var color = [800, 600, 400, 300, 100, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(color: Colors.red[color[index]]),
            child: ListTile(
              title: Text(name[index]),
              subtitle: Text("${price[index]}"),
              leading: Image(
                image: AssetImage(images[index]),
              ),
              trailing: Wrap(children: const [
                Icon(Icons.favorite),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.shopping_cart)
              ]),
            ),
          );
        },
        itemCount: name.length,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: List_Builder(),
  ));
}
