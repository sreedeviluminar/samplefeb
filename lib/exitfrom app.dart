import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: BackPress(),));
}
class BackPress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showalert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Exit!!!!!!!!!!"),
              content: const Text("Do u want to exit??"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("No"))
              ],
            );
          });
    }
    return WillPopScope(
      onWillPop: showalert,
      child: const Scaffold(
        body: Center(
          child: Text("Press Back Button for Exit"),
        ),
      ),
    );
  }
}
