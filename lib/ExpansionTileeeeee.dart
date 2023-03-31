import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Expansionn(),
  ));
}

class Expansionn extends StatefulWidget {
  @override
  State<Expansionn> createState() => _ExpansionnState();
}

class _ExpansionnState extends State<Expansionn> {
  final GlobalKey<ExpansionTileCardState> card1 = GlobalKey();
  final GlobalKey<ExpansionTileCardState> card2 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Card"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ExpansionTileCard(
              key: card1,
              title: const Text("TAP ME!!!"),
              leading: const CircleAvatar(
                child: Text("1"),
              ),
              subtitle: const Text("Tap to Expand"),
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                  title: Text("PINK"),
                ),
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                    title: Text("GREEN")),
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                    title: Text("RED"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ExpansionTileCard(
              key: card2,
              title: const Text("TAP ME!!!"),
              leading: const CircleAvatar(
                child: Text("2"),
              ),
              subtitle: const Text("Tap to Expand"),
              children: const [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                  title: Text("BLUE"),
                ),
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                    title: Text("YELLOW")),
                ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                    title: Text("BLACK"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
