import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:samplefeb/loginPage.dart';

void main() {
  runApp(MaterialApp(
    home: const IntroScreenn(),
    theme: ThemeData(
      textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
    ),
  ));
}

class IntroScreenn extends StatefulWidget {
  const IntroScreenn({Key? key}) : super(key: key);

  @override
  State<IntroScreenn> createState() => _IntroScreennState();
}

class _IntroScreennState extends State<IntroScreenn> {
  @override
  Widget build(BuildContext context) {
    const PageDecoration pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
        bodyTextStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w200,
            color: Colors.yellowAccent),
        imagePadding: EdgeInsets.all(20),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orange,
          Colors.deepOrangeAccent,
          Colors.red,
          Colors.redAccent
        ])));

    return IntroductionScreen(
      pages: [
        PageViewModel(
            decoration: pageDecoration,
            title: "First page",
            body:
                """ Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.
                    introduction_screen uses another package, dots_indicator, that I also created.""",
            image: introImage(
                "https://images.unsplash.com/photo-1678392898477-43bd13b02158?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")),
        PageViewModel(
            decoration: pageDecoration,
            title: "Second page",
            body:
                """ Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.
                    introduction_screen uses another package, dots_indicator, that I also created.""",
            image: introImage(
                "https://images.unsplash.com/photo-1678311146766-9d147b40c0b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")),
        PageViewModel(
            decoration: pageDecoration,
            title: "Third page",
            body:
                """ Introduction Screen allows you to have a screen on an app's first launch to, for example, explain your app. This widget is very customizable with a great design.
                    introduction_screen uses another package, dots_indicator, that I also created.""",
            image: introImage(
                "https://images.unsplash.com/photo-1678033382919-fa907632fdda?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80")),
      ],
      onDone: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())),
      onSkip: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())),
      showSkipButton: true,
      //showBackButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text('Continue to Home'),
      dotsDecorator: const DotsDecorator(
        size: Size(10, 10),
        color: Colors.black,
        activeColor: Colors.greenAccent,
        activeSize: Size(25, 15),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
    );
  }

  Widget introImage(String image) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.network(
        image,
        width: 350,
      ),
    );
  }
}
