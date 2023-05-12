import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samplefeb/storage/firebaseee/Reg%20and%20Login/fire_authentication.dart';
import 'package:samplefeb/storage/firebaseee/Reg%20and%20Login/login.dart';

class Homef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            ElevatedButton(onPressed: () {
              FireHelper().signOut().then((v) {
                Get.to(LoginPage());
              });
            }, child: Text("SignOut"))
          ],
        ),
      ),
    );
  }
}
