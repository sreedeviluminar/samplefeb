import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:samplefeb/apiIntegration/usingDio/controller/controller.dart';
import 'package:samplefeb/apiIntegration/usingDio/utils/colors.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomePost(),
  ));
}

class HomePost extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgcolor,
      appBar: buildAppBar(),
      floatingActionButton: Obx(() =>
       controller.isInternetConnected.value
          ? buildFAB()
          : Container()),

      body: Obx(
            () =>
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: controller.isInternetConnected.value ?
                       controller.isLoading.value ? buildLoading() : buildMainBody()
                    : buildNoInternetConnection(context)
            ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.prcolor,
      centerTitle: true,
      title: Text("Get Api from Dio"),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
        backgroundColor: MyColors.prcolor,
        onPressed: () {
          controller.isListScrollToDown.value
              ? controller.scrollListUpWard()
              : controller.scrollListDownWard();
        },
        child: FaIcon(controller.isListScrollToDown.value
            ? FontAwesomeIcons.arrowUp
            : FontAwesomeIcons.arrowDown));
  }

  buildLoading() {}

  buildMainBody() {}

  buildNoInternetConnection(BuildContext context) {}
}
