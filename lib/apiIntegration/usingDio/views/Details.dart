import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:samplefeb/apiIntegration/usingDio/controller/controller.dart';
import 'package:samplefeb/apiIntegration/usingDio/utils/colors.dart';

class DetailsPage extends StatelessWidget {
  int index;

  DetailsPage({required this.index, Key? key}) : super(key: key);

  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.prcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.bgcolor,
        title: const Text("Details View"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.sccolor),
              child: Center(
                child: Text(
                  controller.posts[index].id.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.posts[index].title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                controller.posts[index].body,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
