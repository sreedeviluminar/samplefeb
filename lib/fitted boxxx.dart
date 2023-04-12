import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      useInheritedMediaQuery: true,
      home: FittedBoxxxx(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
class FittedBoxxxx extends StatefulWidget {
  const FittedBoxxxx({Key? key}) : super(key: key);

  @override
  State<FittedBoxxxx> createState() => _FittedBoxxxxState();
}

class _FittedBoxxxxState extends State<FittedBoxxxx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitted Box"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Card(
              color: Colors.green,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Container(color:Colors.red,child: Text("Random data"),)),
                    Expanded(flex:2,child: Container(height: 200,child: Image.asset("assets/images/rain.jpg"),))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
