import 'package:animated/const.dart';
import 'package:animated/model/rive_model.dart';
import 'package:animated/screens/entryPoint/components/animated_bar.dart';
import 'package:animated/screens/home/home_screen.dart';
import 'package:animated/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              ...List.generate(bottomNavList.length, (index) => GestureDetector(
                onTap: () {

                  bottomNavList[index].input!.value = true;
                  if(bottomNavList[index] != selectedBottomNav){
                    setState(() {
                      selectedBottomNav = bottomNavList[index];
                    });
                  }
                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavList[index].input!.value = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                isActive: bottomNavList[index] == selectedBottomNav),
                    SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity: selectedBottomNav == bottomNavList[index] ? 1 : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavList.first.src,
                            artboard: bottomNavList[index].artBoard,
                            onInit: (artBoard) {
                              StateMachineController controller =
                              RiveUtils.getRiveController(artBoard,
                                  stateMachineName: bottomNavList[index].stateMachineName);
                              bottomNavList[index].input = controller.findSMI('active') as SMIBool;
                            },
                          ),
                        )),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

