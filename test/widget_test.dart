import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotateAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    rotateAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    sizeAnimation = Tween(begin: 2.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Animations'),
        ),
        body: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Transform(
                    transform: Matrix4.identity(),
                    alignment: Alignment.center,
                    child: Container(
                      height: sizeAnimation.value,
                      width: sizeAnimation.value,
                      child: RotationTransition(
                        turns: rotateAnimation,
                        child: Image.network(
                            'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png'),
                      ),
                    )),
              );
            }));
  }
}
