import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Grid_with_card(),
  ));
}

class Grid_with_card extends StatelessWidget {
  var color = [
    Colors.blueAccent,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.red,
    Colors.deepPurple,
    Colors.pink[500],
    Colors.teal,
    Colors.orangeAccent,
    Colors.deepOrange,
    Colors.pinkAccent,
    Colors.lightGreen
  ];

  var name = [
    "Camera",
    "Call",
    "Banking",
    "Music Library",
    "My Files",
    "Gallery",
    "Calender",
    "Messages",
    "Note Pad",
    "Scanner",
    "Settings",
    "Voice Recorder"
  ];
  var image = [
    "assets/icons/Camera-icon.png",
    "assets/icons/Dialer-icon.png",
    "assets/icons/Election-Polling-Box-Outline-icon.png",
    "assets/icons/Files-icon.png",
    "assets/icons/Folder-Devolper-icon.png",
    "assets/icons/Gallery-icon.png",
    "assets/icons/iCal-icon.png",
    "assets/icons/Message-icon.png",
    "assets/icons/Notes-icon.png",
    "assets/icons/Phone-Manager-icon.png",
    "assets/icons/Settings-icon.png",
    "assets/icons/Siri-icon.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5,
                    spreadRadius: 7,
                    offset: Offset(-2,-8)),
              ], borderRadius: BorderRadius.circular(20), color: color[index]),
              child: Center(
                child: ListTile(
                  title: Text(name[index]),
                  leading: Image.asset(image[index]),
                ),
              ),
            ),
          );
        },
        itemCount: color.length,
      ),
    );
  }
}
