// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class AnimatedTransition extends PageRouteBuilder {
  AnimatedTransition({
    required this.page,
  }) : super(
            pageBuilder: (context, animation, animationn) => page,
            transitionsBuilder: (context, animation, animationtwo, child) {
              var begin= const Offset(0, -1); 

     var end = const Offset(0, 0);

     var tween = Tween(begin: begin,end: end,);
     var offsetanimation= animation.drive(tween,);
     return SlideTransition(position: offsetanimation,child: child,); 
              
            });
  final page;
}

class AnimatedScaleTransition extends PageRouteBuilder {
  AnimatedScaleTransition({
    required this.page,
  }) : super(
            pageBuilder: (context, animation, animationn) => page,
            transitionsBuilder: (context, animation, animationtwo, child) {
              var begin= 0.0; 
     var end = 1.0;
     var tween = Tween(begin: begin,end: end);
     
     var animationcurves= CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
    

     return ScaleTransition(scale: tween.animate(animationcurves),child: child,);
              
            });
  final page;
}

// all this writen inside transitionBuilder
/*


var begin= Offset(0, 1); offset for animation.drive

     var end = Offset(0, 0);

     var tween = Tween(begin: begin,end: end);
     var offsetanimation= animation.drive(tween);
     return SlideTransition(position: offsetanimation,child: child,); 
     --slidetransition work by offset()
     */

//-----------------------------------------------------

/* 
     var begin= 0.0; --- double for ScaleTransition--- scale begin from 0 
     var end = 1.0; -------------------------------- scale end to one 
     var tween = Tween(begin: begin,end: end);-----define tween

     
     var animationcurves= CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
     --animation by curves and replace animation.drive--curve:Curves.there are many types and styles

     return ScaleTransition(scale: tween.animate(animationcurves),child: child,);*/
// animation by curves
//----------------------------------------------------------

/*
 looks like ScaleTransition
     var begin= 0.0; 0 degree

     var end = 1.0; 360 degree

     var tween = Tween(begin: begin,end: end);
     var animationcurve= CurvedAnimation(parent: animation, curve: Curves.bounceIn);
     return RotationTransition(turns: tween.animate(animationcurve) ,child: child,); */

/*
      return Align(child: SizeTransition(sizeFactor: animation,child: child,));
      --- onlu this line 
      --- align control the animation place start but the best its default => Align(align: Alignment.center)
      */

//---------------------------------------------------------------------------------------
/*
      return FadeTransition(opacity: animation,child: child,);
      */
