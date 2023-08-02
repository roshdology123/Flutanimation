import 'package:animated/components/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../utils/rive_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 288,
      height: double.infinity,
      color: Color(0xff17203a),
      child: SafeArea(
        child: Column(
          children: [
            InfoCard(
              name: "Abdallah Roshdy",
              profession: "Flutter Developer",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            SideMenuTile(),
          ],
        ),
      ),
    ));
  }
}

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Divider(
            color: Colors.white24,
            thickness: 1,
          ),
        ),
        ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset(
              "assets/RiveAssets/icons.riv",
              artboard: "HOME",
              onInit: (artBoard) {
                StateMachineController controller =
                    RiveUtils.getRiveController(artBoard);
                controller.isActive = true;
              },
            ),
          ),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
