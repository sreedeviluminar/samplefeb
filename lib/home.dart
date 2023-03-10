import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = ["apple", "orange", "grapes", "kiwi", "jackfruit"];
    var images = [
      "assets/icons/apple.png",
      "assets/icons/orange.png",
      "assets/icons/bananas.png",
      "assets/icons/grapes.png",
      "assets/icons/mango.png"
    ];
   var price =[100,200,300,400,500];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
      ),
      body: ListView(
          children: List.generate(5,
                (index) =>
                Card(
                  child: ListTile(
                    title:  Text(name[index]),
                    subtitle: Text("\$ ${price[index]}"),
                    leading: Image.asset(images[index]),
                    trailing: const Icon(Icons.shopping_cart),
                  ),
                ),
          )

        ///direct value to the list
        //[
        //  const Center(child: Text("My Fruits",style: TextStyle(fontSize: 25),),),
        //   Card(
        //     child: ListTile(
        //       title: const Text("Apple"),
        //       subtitle: const Text("\$380"),
        //       leading: Image.asset("assets/icons/apple.png"),
        //       trailing: const Icon(Icons.shopping_cart),
        //     ),
        //   ),
        //   const Card(
        //     child: ListTile(
        //       title: Text("Apple"),
        //       subtitle: Text("\$380"),
        //       leading: CircleAvatar(
        //           backgroundImage:NetworkImage(
        //               "https://images.unsplash.com/photo-1471943038886-87c772c31367?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZydWl0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60")),
        //       trailing: Icon(Icons.shopping_cart),
        //     ),
        //   ),
        //   const Text("Apple"),
        //   const Text("Apple"),
        // ],
      ),
    );
  }
}
