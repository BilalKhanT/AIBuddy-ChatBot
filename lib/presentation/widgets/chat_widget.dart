import 'package:chat_bot/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/assets_manager.dart';
import '../../utils/colors.dart';


class ChatWidget extends StatelessWidget {

  final String msg;
  final bool isUser;
  final double screenWidth;

  const ChatWidget({Key? key, required this.msg, required this.isUser, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  isUser == true? AssetsManager.userImage : AssetsManager.botImage,width: 30, height: 30, ),

                const SizedBox(
                  width: 8,),

                Expanded(
                  child: TextWidget(
                    label: msg,),
                ),



                isUser == true?
                    const SizedBox.shrink()
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Icon(Icons.thumb_up_alt_outlined, color: textColor,),
                    SizedBox(width: 5,),
                    Icon(Icons.thumb_down_alt_outlined, color: textColor,)
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
