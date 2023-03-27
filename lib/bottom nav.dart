import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BottomBar1(),
  ));
}

class BottomBar1 extends StatefulWidget {
  const BottomBar1({Key? key}) : super(key: key);

  @override
  State<BottomBar1> createState() => _BottomBar1State();
}

class _BottomBar1State extends State<BottomBar1> {
  List screens = const [
    Text("Home"),
    Text("Favorite"),
    Text("People"),
    Text("Search"),
    Text("Login")
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Bar"),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
        child: BottomNavigationBar(
          currentIndex: index,
          type: BottomNavigationBarType.shifting,
          onTap: (tapindex) {
            setState(() {
              index = tapindex;
            });
          },
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.yellowAccent,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
          ],
        ),
      ),
      body: Center(
        child: screens[index],
      ),
    );
  }
}
