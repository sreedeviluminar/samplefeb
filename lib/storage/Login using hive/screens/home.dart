import 'package:flutter/material.dart';

class Homeee extends StatelessWidget {
  final String email;

  const Homeee({Key? key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome $email',
          style: const TextStyle(fontSize: 30, color: Colors.pink),
        ),
      ),
    );
  }
}
