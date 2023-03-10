import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:samplefeb/register.dart';

import 'home.dart';
//
// void main() {
//   runApp(DevicePreview(
//     builder: (BuildContext context) => MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.purple),
//       useInheritedMediaQuery: true,
//       home: LoginValidation(),
//       debugShowCheckedModeBanner: false,
//     ),
//   ));
// }

class LoginValidation extends StatefulWidget {
  const LoginValidation({Key? key}) : super(key: key);

  @override
  State<LoginValidation> createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  GlobalKey<FormState> formkey = GlobalKey();

  /// for fetching the current state of form
  bool showpass = true;

  /// for checking the password is visible or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Validation"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
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
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "UserName",
                      prefixIcon: Icon(Icons.account_box_sharp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                  validator: (uname) {
                    if (uname!.isEmpty ||
                        !uname.contains('@') ||
                        !uname.contains('.')) {
                      return 'Enter a valid UserName';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscuringCharacter: '*',
                  obscureText: showpass,
                  decoration: InputDecoration(
                      hintText: "PassWord",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass) {
                              showpass = false;
                            } else {
                              showpass = true;
                            }
                          });
                        },
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      final valid = formkey.currentState!.validate();
                      if (valid) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    child: const Text('Login', style: TextStyle(fontSize: 15))),
              ),
              TextButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  child: const Text(
                    "Not a User?? SignUp Here!!",
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
