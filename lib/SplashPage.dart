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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.scatter_plot,
            //   size: 130,
            //   color: Colors.purple,
            // ),
           // Image.asset("assets/icons/tent.png",height: 300,width: 300,),
            Image.network("https://icons.iconarchive.com/icons/designbolts/emoji/256/Emoji-Cute-icon.png"),
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
    );
  }
}
