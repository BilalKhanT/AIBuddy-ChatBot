import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_bot/presentation/ui_screens/chat_screen.dart';
import 'package:chat_bot/presentation/ui_screens/get_started_screen.dart';
import 'package:chat_bot/utils/assets_manager.dart';
import 'package:chat_bot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: screenHeight * 0.2,
                  width: screenHeight * 02,
                  child: Image.asset(AssetsManager.iconImage,)),
            ],
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        nextScreen: GetStartedScreen(),
        splashIconSize: 250,
        splashTransition: SplashTransition.scaleTransition,
      );
  }
}