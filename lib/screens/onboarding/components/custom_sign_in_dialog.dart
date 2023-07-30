import 'package:animated/screens/onboarding/components/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSignInDialog(BuildContext context,{required ValueChanged onClosed}) {
  return showGeneralDialog(
      barrierDismissible: true,
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      barrierLabel: "Sign In",
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 620,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(
              vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.90),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget nunc ut dignissim sodales.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SignInForm(),
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.0),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Sign up with Email, Apple or Google",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/email_box.svg",
                                  height: 64,
                                  width: 64,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/apple_box.svg",
                                  height: 64,
                                  width: 64,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  "assets/icons/google_box.svg",
                                  height: 64,
                                  width: 64,
                                )),
                          ])
                    ],
                  ),
                ),
                const Positioned(

                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: CircleAvatar(

                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )).then(onClosed);
}
