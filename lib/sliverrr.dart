import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SliverExx(),
  ));
}

class SliverExx extends StatelessWidget {
  var color = [900,800,700, 600,500, 400, 300, 200,100, 50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            title: const Text("Custom AppBar"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite))
            ],
            bottom: AppBar(
              elevation: 0,
              title: Container(
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "Search Something",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_alt)),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((ctx,index) {
            return Container(
              height: 80,
              child: Text(""),
              color: Colors.pink[color[index]],
            );
          },childCount: 10))
        ],
      ),
    );
  }
}
