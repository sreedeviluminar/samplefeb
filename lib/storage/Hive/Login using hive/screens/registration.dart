import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/Database.dart';
import '../model/usermodel.dart';


class Registration extends StatelessWidget {
  TextEditingController usename = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
         const Center(
            child: Text(
              "Registration Page",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: usename,
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: confirmpass,
              decoration: const InputDecoration(
                  hintText: "Confirm Password", border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                validateSignUp();
              },
              child: const Text("Register"))
        ],
      ),
    );
  }

  void validateSignUp() async {
    final email = usename.text.trim(); // email from controller
    final pass = password.text.trim(); // password from controller
    final cpass = confirmpass.text.trim(); // confirm password from controller

    final emailValidationResult = EmailValidator.validate(email);

    if (email != "" && pass != "" && cpass != "") {
      if (emailValidationResult == true) {
        final passValidationResult = checkPassword(pass, cpass);
        if (passValidationResult == true) {
          final user = User(email: email, password: pass);
          await DBFunction.instance.userSignUp(user);
          Get.back();
          Get.snackbar("Success", "Account created");
        }
      } else {
        Get.snackbar("Error", "Provide a valid Email");
      }
    } else {
      Get.snackbar("Error", "Fields Can not be empty");
    }
  }

  bool checkPassword(String pass, String cpass) {
    if (pass == cpass) {
      if (pass.length < 6) {
        Get.snackbar("Error", "Password length should be > 6");
        return false;
      } else {
        return true;
      }
    } else {
      Get.snackbar("Error", "Password mismatch");
      return false;
    }
  }
}
