import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
void main() {
  runApp(MaterialApp(
    home: Riveeee(),
    theme:  ThemeData(
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              color: Colors.white
          )
      ),
    ),
  ));
}

class Riveeee  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(
       child: RiveAnimation.asset("assets/animation/eyes-following-cursor.riv"),
     ),
   );
  }
}
