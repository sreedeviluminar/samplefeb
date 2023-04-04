import 'package:flutter/material.dart';
import 'package:samplefeb/passing%20data%20between%20screen/dummydata.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fetch the id from the previous page
    final id = ModalRoute.of(context)?.settings.arguments;

    // fetch the product  from dummydata corresponding to the id from the previous page
    final product = dummyProducts.firstWhere((product) => product["id"] == id);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Image.network(product["image"])),
            Text(
              "${product["name"]}",
              style: TextStyle(fontSize: 30),
            ),
            Text("${product["description"]}")
          ],
        ),
      ),
    );
  }
}
