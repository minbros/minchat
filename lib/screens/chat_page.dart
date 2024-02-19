import 'package:flutter/material.dart';
import 'package:minchat/chat/chat_room.dart';
import 'package:minchat/chat/new_message.dart';
import 'package:minchat/config/palette.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.userID, required this.roomID});

  final String userID;
  final String roomID;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = screenHeight / screenWidth;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Palette.appBarIconColor,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: Palette.backgroundGradient,
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                (screenRatio >= 2) ? screenWidth * 0.05 : screenWidth * 0.1,
                screenHeight * 0,
                (screenRatio >= 2) ? screenWidth * 0.05 : screenWidth * 0.1,
                screenHeight * 0.02,
              ),
              child: Column(
                children: [
                  Expanded(child: ChatRoom(userID: userID, roomID: roomID)),
                  SizedBox(height: screenHeight * 0.008),
                  NewMessage(userID: userID, roomID: roomID),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
