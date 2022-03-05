import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return PlayAnimation<double>(
      duration:  Duration(milliseconds: (500*delay).round()),
      tween: Tween(begin: -200, end: 0),
      child: child,
            curve: Curves.bounceInOut,

      builder: (context, child, animation) => Transform.translate(
        // scale: animation,
        offset: Offset(0, animation), 
        child: child
      ),
    );
  }
}