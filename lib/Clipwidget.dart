import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: Clipperrr(),
  ));
}

class Clipperrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(
              "https://images.unsplash.com/photo-1574913518252-b24f788531d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM0fEpwZzZLaWRsLUhrfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
          ClipRect(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                widthFactor: .7,
                heightFactor: .4,
                child: Image.network(
                    "https://images.unsplash.com/photo-1574913518252-b24f788531d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM0fEpwZzZLaWRsLUhrfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
                "https://images.unsplash.com/photo-1668988729385-3af3eabf6442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1822&q=80"),
          ),
          const SizedBox(
            height: 30,
          ),
          ClipOval(
            child: Container(
              child: Image.network(
                  "https://images.unsplash.com/photo-1668988729385-3af3eabf6442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1822&q=80"),
              ),
          ),
          const SizedBox(
            height: 30,
          ),

         ClipPath(
           clipper: MovieTicketClipper(),
           child: Container(
             height: 300,
             width: 300,
             child: Image.network(
                 "https://images.unsplash.com/photo-1668988729385-3af3eabf6442?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1822&q=80"),
           ),

         )
        ],
      ),
    );
  }
}
