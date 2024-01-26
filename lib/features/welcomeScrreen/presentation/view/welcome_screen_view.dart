
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:kuhl_store/core/AnimatedNavigation.dart';
import 'package:kuhl_store/core/usable_names.dart';
import 'package:kuhl_store/features/homeScreen/presentation/view/home_screen_view.dart';
import 'package:kuhl_store/features/welcomeScrreen/presentation/view/animation_widget.dart';

class WelcomeScreenView extends StatefulWidget {
  const WelcomeScreenView({super.key});

  @override
  State<WelcomeScreenView> createState() => _WelcomeScreenViewState();
}
late AnimationController ac;
late Animation<Offset> slide;
class _WelcomeScreenViewState extends State<WelcomeScreenView> with TickerProviderStateMixin{
  @override
  void initState() {
    animationdata();
    super.initState();
    navigatToHome();
  }

  

  @override
  void dispose() {
    
    super.dispose();
    ac.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: MediaQuery.sizeOf(context).height*0.15,
                decoration: const BoxDecoration(
                  color:  UsableNames.col
                ),
              ),
            ),
            SlidingAnimationWithBuilder(sliding: slide, child: SizedBox(
                  child: Image(
                    height: MediaQuery.of(context).size.height*0.45,
                    width: MediaQuery.of(context).size.width*0.35,
                    image: const AssetImage('assets/images/Managerial.png')),
                ), ),

                
                 ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                 height: MediaQuery.sizeOf(context).height*0.15,
                 decoration: const BoxDecoration(
                   color:  UsableNames.col
                 ),
                  ),
                            )
          ],
        ) ,
      )
      );
  }
  // ----------------------------functions----------------------------------------------------
  void navigatToHome() {
  
    Future.delayed(
      const Duration(seconds: 5),
      () {
       Navigator.of(context).pushReplacement(AnimatedScaleTransition(page: const HomeScreenView()));
    },);
  }

  void animationdata() {
       ac=AnimationController(vsync: this,duration:const  Duration(seconds:2));
    slide= Tween<Offset>(begin: const Offset(0, 5),end:const Offset(0,0)).animate(ac);
    ac.forward();
  }
}