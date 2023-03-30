import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Drawerrr(),
    theme:  ThemeData(
      textTheme: TextTheme(
         bodySmall: TextStyle(
           color: Colors.white
         )
      ),
    ),
  ));
}

class Drawerrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nav Drawer"),
      ),
      drawer:
      // Theme(
      //   data: Theme.of(context).copyWith(canvasColor: Colors.green),
      Drawer(
          child: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.yellowAccent,
                    Colors.white
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
              )),
            child: ListView(
              children: const [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/rain.jpg"))),
                  accountName: Text("Sreedevi P M"),
                  accountEmail: Text("sree@gmail.com"),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/apple.png"),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/tent.png"),
                    ),
                  ],
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/logingirl.png"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
