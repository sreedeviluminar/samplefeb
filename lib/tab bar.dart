import 'package:flutter/material.dart';
import 'package:samplefeb/List%20with%20Separator.dart';
import 'package:samplefeb/home.dart';
import 'package:samplefeb/list%20with%20builder.dart';
import 'package:samplefeb/loginPage.dart';

void main() {
  runApp(const MaterialApp(
    home: MyTab(),
  ));
}

class MyTab extends StatelessWidget {
  const MyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("WhatsApp"),
            actions: [
              const Icon(Icons.camera_alt),
              const Icon(Icons.search),
              PopupMenuButton(itemBuilder: (context){
                return [
                  const PopupMenuItem(child:Text("Settings")),
                  const PopupMenuItem(child:Text("NewGroup")),
                  const PopupMenuItem(child:Text("New Broadcast")),
                  const PopupMenuItem(child:Text("linked device")),
                ];
              })
            ],
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                  child: const Tab(icon: Icon(Icons.people),)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: const Tab(text: "Chat",)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: const Tab(text: "Status",)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: const Tab(text: "Call",)),
            ],),
          ),
          body:  TabBarView(
            children: [
            // Center(child: Text("COMMUNITY"),),
            // Center(child: Text("CHATS"),),
            // Center(child: Text("STATUS"),),
            // Center(child: Text("CALLS"),)
            List_Separator(),
            List_Builder(),
              const HomeScreen(),
              LoginPage()
          ],),
        )
    );
  }
}
