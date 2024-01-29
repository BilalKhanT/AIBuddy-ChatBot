import 'package:chat_bot/dependency_injection/get_it.dart';
import 'package:chat_bot/presentation/cubit/resp_cubit/resp_cubit.dart';
import 'package:chat_bot/presentation/cubit/resp_cubit/resp_state.dart';
import 'package:chat_bot/presentation/widgets/chat_widget.dart';
import 'package:chat_bot/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ResponseCubit _responseCubit;
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _responseCubit = getItInstance<ResponseCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    _responseCubit?.close();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isUser': true});
      });
      _responseCubit.sendMessage(text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 20,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(AssetsManager.iconImage),
        ),
        title: Text('AI Buddy',
        style: GoogleFonts.poppins(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),),
      ),
      backgroundColor: scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.03,
            width: screenWidth,
            color: scaffoldBackgroundColor,
          ),
          Expanded(
            child: BlocListener<ResponseCubit, ResponseState>(
              bloc: _responseCubit,
              listener: (context, state) {
                if (state is ResponseLoading) {
                  CircularProgressIndicator();
                } else if (state is ResponseLoaded) {
                  setState(() {
                    _messages.add({'text': state.response, 'isUser': false});
                  });
                }
              },
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ChatWidget(
                      msg: message['text'],
                      isUser: message['isUser'],
                      screenWidth: screenWidth,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message here...',
                      hintStyle: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
