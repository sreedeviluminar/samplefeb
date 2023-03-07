import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Splshh(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splshh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// gradient colors for whole body
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black,
          Colors.green,
          Colors.greenAccent,
          Colors.black
        ], begin: Alignment.centerLeft, end: Alignment.topRight)),

        /// single color for whole body
        //color: Colors.black ,
        /// network or asset image for whole body
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //         image: AssetImage("assets/images/rain.jpg"))),
        //         NetworkImage(
        //         "https://images.unsplash.com/photo-1677932394762-64ff2b2250be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOXx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60"))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.scatter_plot,
              //   size: 130,
              //   color: Colors.purple,
              // ),
              Image.asset(
                "assets/icons/tent.png",
                height: 200,
                width: 200,
              ),
              // Image.network(
              //     "https://icons.iconarchive.com/icons/designbolts/emoji/256/Emoji-Cute-icon.png"),
              const Text(
                "My Application Feb",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
