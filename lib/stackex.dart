import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Stack_Ex(),));
}
class Stack_Ex extends StatelessWidget {
  const Stack_Ex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack",),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(color: Colors.green,height: 500,width: 500,),
            Positioned(child: Container(color: Colors.red,height: 400,width: 400,),left: 20,top:30),
            Positioned(child: Container(color: Colors.yellowAccent,height: 200,width: 200,),),
            Container(color: Colors.blue,height: 150,width: 150,),
          ],
        ),
      ),
    );

  }
}
