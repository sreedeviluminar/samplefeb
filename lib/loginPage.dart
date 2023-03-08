import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      useInheritedMediaQuery: true,
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  "assets/icons/logingirl.png",
                  width: 200,
                  height: 200,
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
              ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  ),
              ),
               ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login',style: TextStyle(fontSize: 15))),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Not a User?? SignUp Here!!", style: TextStyle(fontSize: 15),)),
            ],
          ),
        ));
  }
}
