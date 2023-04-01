import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: SimpleAlert(),));
}
class SimpleAlert extends StatefulWidget {
  @override
  State<SimpleAlert> createState() => _SimpleAlertState();
}

class _SimpleAlertState extends State<SimpleAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Alert")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Exit!!!!!!!!!!"),
                      content: const Text("Do u want to exit??"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Yes")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"))
                      ],
                    );
                  });
            },
            child: const Text("Show Alert"),
          ),
        ));
  }
}
