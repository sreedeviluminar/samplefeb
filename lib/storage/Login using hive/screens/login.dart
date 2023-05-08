import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:samplefeb/storage/Login%20using%20hive/screens/registration.dart';
import '../model/usermodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Hive.registerAdapter(UserAdapter());
  Hive.openBox<User>('user');

  runApp(GetMaterialApp(
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           const Center(
             child: Text(
              "Login Page",
              style: TextStyle(fontSize: 20),
          ),
           ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: uname,
              decoration: const InputDecoration(
                  hintText: "Username", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: pass,
              decoration: const InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Login")),
          TextButton(
              onPressed: () {
                Get.to(Registration());
              },
              child: const Text("Not a User?.. Register Here!!"))
        ],
      ),
    );
  }
}
