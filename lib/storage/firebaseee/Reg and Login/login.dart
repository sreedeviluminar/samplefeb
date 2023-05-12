
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:samplefeb/storage/firebaseee/Reg%20and%20Login/fire_authentication.dart';
import 'package:samplefeb/storage/firebaseee/Reg%20and%20Login/registartion.dart';
import '../../Hive/Login using hive/screens/registration.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  String? email;
  String? pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Form(
        key: formkey,
        child: Column(
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
                onSaved: (pass) {
                  pwd = pass;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    FireHelper().signIn(mail: email!, pass: pwd!).then((value){
                      if(value == null){
                        Get.to(Homef());
                      }else{
                        Get.snackbar("Error", "User not found $value");
                      }
                    });
                  }
                },
                child: const Text("Login")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.to(RegistrationPAGE());
                },
                child: const Text("SignUp Here")),
          ],
        ),
      ),
    );
  }
}
