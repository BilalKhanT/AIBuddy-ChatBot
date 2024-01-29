import 'package:chat_bot/presentation/ui_screens/chat_screen.dart';
import 'package:chat_bot/utils/assets_manager.dart';
import 'package:chat_bot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: screenHeight * 0.1,),
          Container(
            height: screenHeight * 0.3,
            width: screenHeight * 0.3,
            child: Image.asset(AssetsManager.vector),
          ),
          SizedBox(height: screenHeight * 0.05,),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(right: 20.0, left: 20.0),
              child: Column(
                children: [
                  Text(
                    'Experience seamless assistance with AI Buddy. It\'s designed to provide you with ',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                  ),),
                  Center(child: Text('realtime support.',
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: 16,
                    ),)),
                ],
              ),

            ),
          ),
          SizedBox(height: screenHeight * 0.1,),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Container(
                height: screenHeight * 0.065,
                width: screenWidth - 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: cardColor,
                  border: Border.all(
                    width: 2,
                    color: Colors.purpleAccent,
                  )
                ),
                child: Center(
                  child: Text('Get Started',
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
