import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:samplefeb/apiIntegration/usingDio/controller/controller.dart';
import 'package:samplefeb/apiIntegration/usingDio/utils/colors.dart';
import 'package:samplefeb/apiIntegration/usingDio/utils/constSnack.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'Details.dart';

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
          controller.isInternetConnected.value ? buildFAB() : Container()),
      body: Obx(
        () => SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isInternetConnected.value
                ? controller.isLoading.value
                    ? buildLoading()
                    : buildMainBody()
                : buildNoInternetConnection(context)),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.prcolor,
      centerTitle: true,
      title: const Text("Get Api from Dio"),
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

  Center buildLoading() {
    return Center(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_t9gkkhz4.json"),
      ),
    );
  }

  Center buildNoInternetConnection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Lottie.network(
                "https://assets4.lottiefiles.com/packages/lf20_tasn1wnv.json"),
          ),
          MaterialButton(
            onPressed: () => onTapButton(context),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: MyColors.prcolor,
            child: const Text(
              "Try Again",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void onTapButton(BuildContext context) async {
    if (await InternetConnectionChecker().hasConnection == true) {
      controller.getPosts();
    } else {
      showCustomSnackbar(context);
    }
  }

  RefreshIndicator buildMainBody() {
    return RefreshIndicator(
        onRefresh: (){
          return controller.getPosts();
        },
        child: ScrollablePositionedList.builder(
            itemScrollController: controller.itemController,
            physics: BouncingScrollPhysics(),
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(DetailsPage(index: index),
                      transition: Transition.leftToRightWithFade);
                },
                child: Card(
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(controller.posts[index].id.toString()),
                    ),
                    title: Text(
                      controller.posts[index].title,
                      style: TextStyle(color: Colors.lightGreenAccent),
                    ),
                    subtitle: Text(
                      controller.posts[index].body,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              );
            }));
  }
}
