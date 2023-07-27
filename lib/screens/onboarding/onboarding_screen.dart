import 'dart:ui';

import 'package:animated/screens/onboarding/components/animated_btn.dart';
import 'package:animated/screens/onboarding/components/custom_sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset("assets/Backgrounds/Spline.png")),
      Positioned.fill(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
      )),
      const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
      Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox())),
      AnimatedPositioned(
        top: isSignInDialogShown ? -50 : 0,
        duration: const Duration(milliseconds: 240),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                width: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Learn design   & code",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          height: 1.2),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                          " Sed ut purus eget nunc ut dignissim sodales."
                          " Lorem ipsum dolor sit amet, consectetur adipiscing "
                          "elit. Sed ut purus eget nunc ut dignissim sodales.",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                  Future.delayed(
                     const Duration(milliseconds: 800),
                          (){
                    setState(() {
                      isSignInDialogShown = true;
                    });
                    customSignInDialog(context,onClosed: (_){
                      setState(() {
                        isSignInDialogShown = false;
                      });
                    });
                  });


                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Sed ut purus eget nunc ut dignissim sodales. Lorem ipsum "
                      "dolor sit amet, consectetur adipiscing elit. Sed ut purus "
                      "eget nunc ut dignissim sodales.",
                ),
              ),
            ],
          ),
        )),
      )
    ]));
  }

}
