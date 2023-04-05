import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: Run(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}
class Run extends StatelessWidget {
  var orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app

    orientation = MediaQuery.of(context).orientation;

    //size of the window

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation Media Query"),
        backgroundColor: Colors.green,
      ),
      // checking the orientation
      body: orientation == Orientation.portrait
          ? Container(
              color: Colors.blue,
              height: height / 4,
              width: width / 4,
            )
          : Container(
              height: height / 2,
              width: width / 2,
              color: Colors.red,
            ),
    );
  }
}

//Change or lock device orientation
// void main() {
//     WidgetsFlutterBinding.ensureInitialized();
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     runApp(MaterialApp(home: Run()));
// }
