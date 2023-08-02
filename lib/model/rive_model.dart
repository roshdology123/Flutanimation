import 'package:rive/rive.dart';

class RiveAsset {
  final String artBoard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset({
    required this.src,
    required this.artBoard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavList = [
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Chat"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Chat"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "BELL",
      stateMachineName: "BELL_Interactivity",
      title: "Notifications"),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];
List<RiveAsset> sideMenu = [
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "HOME",
      stateMachineName: "HOME_Interactivity",
      title: 'Home'),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: 'Search'),
  RiveAsset(
      src: "assets/RiveAssets/icons.riv",
      artBoard: "HOME",
      stateMachineName: "HOME_Interactivity",
      title: 'Home')
];
