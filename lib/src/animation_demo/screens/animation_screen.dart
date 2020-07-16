import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class AnimationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationScreenState();
  }
}

class AnimationScreenState extends State<AnimationScreen> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  @override
  void initState() {
    super.initState();
    catController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));
    catAnimation = Tween(
      begin: -35.0,
      end: -80.0,
    ).animate(CurvedAnimation(
      parent: catController,
      curve: Curves.easeInOut,
    ));

    boxController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ));
    boxAnimation = Tween(
      begin: pi * 0.6,
      end: pi * 0.65,
    ).animate(CurvedAnimation(
      parent: boxController,
      curve: Curves.linear,
    ));
    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });
    boxController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: GestureDetector(
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
                buildLeftFlap(),
                buildRightFlap(),
              ],
            ),
          ),
          onTap: onTap,
        ));
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          left: 0.0,
          right: 0.0,
        );
      },
      child: Cat(),
    );
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
      boxController.forward();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
      boxController.stop();
    }
  }

  buildBox() {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.brown,
    );
  }

  buildLeftFlap() {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 100.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
              angle: boxAnimation.value,
              child: child,
              alignment: Alignment.topLeft);
        },
      ),
    );
  }

  buildRightFlap() {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10.0,
          width: 100.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
              angle: -boxAnimation.value,
              child: child,
              alignment: Alignment.topRight);
        },
      ),
    );
  }
}
