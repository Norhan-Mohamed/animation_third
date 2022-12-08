import 'dart:math';

import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? Key}) : super(key: Key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation rotateAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..repeat();

    rotateAnimation = Tween(begin: 0, end: pi).animate(controller);
    CurvedAnimation(parent: controller, curve: Curves.decelerate);
    sizeAnimation = Tween(begin: 2.0, end: 200.0).animate(controller);
    controller.forward();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Center(
              child: Container(
                alignment: Alignment.center,
                height: sizeAnimation.value,
                width: sizeAnimation.value,
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: controller,
                  child: Image.network(
                      'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png'),
                ),
              ),
            );
          }),
    );
  }
}
