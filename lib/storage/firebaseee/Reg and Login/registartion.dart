import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samplefeb/storage/firebaseee/Reg%20and%20Login/login.dart';

import 'fire_authentication.dart';

class RegistrationPAGE extends StatelessWidget {
  String? email;
  String? pass;
  String? name;
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:formkey,
        child: ListView(
          children: [
            Image.asset(
              "assets/icons/avatar-default-icon.png",
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
                validator: (name) {
                  if (name!.isEmpty) {
                    return "Enter Some value";
                  } else {
                    return null;
                  }
                },
                onSaved: (ename) {
                  name = ename;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Username"),
                validator: (uname) {
                  if (uname!.isEmpty) {
                    return "Enter Some value";
                  } else {
                    return null;
                  }
                },
                onSaved: (name) {
                  email = name;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Password cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (pwd) {
                  pass = pwd;
                },
              ),
            ),
            ElevatedButton(onPressed: () {
              if(formkey.currentState!.validate()){
                formkey.currentState!.save();
                FireHelper().signUp(mail: email!, password :pass!).then((value) {
                  if(value == null){
                   Get.to(LoginPage());
                  }else{
                    Get.snackbar("Error", value);
                  }
                });
              }
            }, child: const Text("Register")),

          ],
        ),
      ),
    );
  }
}
