import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CSlider(),
  ));
}

class CSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CarouselSlider(
            //   items: [
            //   Container(),
            //   Container()
            // ]
            items: List.generate(10,
                (index) => Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1679705589504-de5e5335a99c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDd8TThqVmJMYlRSd3N8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60"),
                      )),
                    )),
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: .2,
             // height: 200,
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.easeInBack,
              autoPlayAnimationDuration: Duration(seconds: 1),
              enableInfiniteScroll: true,
            )));
  }
}
