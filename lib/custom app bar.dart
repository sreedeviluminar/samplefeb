import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.pink,
  // ));
  runApp(MaterialApp(
    home: CustomAPPbar(),
  ));
}

class CustomAPPbar extends StatefulWidget {
  @override
  State<CustomAPPbar> createState() => _CustomAPPbarState();
}

class _CustomAPPbarState extends State<CustomAPPbar> {

  // void initState() {
  //   // TODO: implement initState
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          "Custom App Bar",
          style: TextStyle(color: Colors.pink),
        ),
        // backgroundColor: Colors.transparent,///transparent appbar
        backgroundColor: Colors.pink.withOpacity(.3),

        ///translucent appbar
        elevation: 0,
      ),
      body: Image.asset("assets/images/rain.jpg",
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
