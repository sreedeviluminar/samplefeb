import 'package:flutter/material.dart';
import 'package:samplefeb/storage/SharedPref/sharedPref_Ex.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences data;
  late String username;

  @override
  void initState() {
    fetchname();
    super.initState();
  }

  void fetchname() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      username = data.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Hai, Welcome $username",
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: (){
              data.setBool('newuser', true);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>LoginSamp()));
            }, child: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
