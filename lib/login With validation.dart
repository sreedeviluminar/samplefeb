import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) => MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      useInheritedMediaQuery: true,
      home: LoginValidation(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class LoginValidation extends StatefulWidget {
  const LoginValidation({Key? key}) : super(key: key);

  @override
  State<LoginValidation> createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {

  GlobalKey<FormState> formkey = GlobalKey();

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

                  validator: (uname){
                    if(uname!.isEmpty || !uname.contains('@') || !uname.contains('.')){
                      return 'Enter a valid UserName';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "PassWord",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),

                  validator: (password){
                    if(password!.isEmpty || password.length < 6){
                       return "enter a valid password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      final valid  = formkey.currentState!.validate();
                      if(valid){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      }
                    },
                    child: const Text('Login', style: TextStyle(fontSize: 15))),
              ),
              TextButton(
                  onPressed: () {},
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
