import 'package:flutter/material.dart';

class SlidingAnimationWithBuilder extends StatelessWidget {
  const SlidingAnimationWithBuilder(
      {Key? key, required this.sliding, required this.child})
      : super(key: key);

  final Animation<Offset> sliding;
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: sliding,
        builder: (context, _) {
          return SlideTransition(position: sliding, child: child);
        });
  }
}
