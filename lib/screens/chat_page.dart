import 'package:flutter/material.dart';
import 'package:minchat/chat/chat_room.dart';
import 'package:minchat/config/palette.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.userID, required this.roomID});

  final String userID;
  final String roomID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Palette.appBarIconColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: Palette.backgroundGradient,
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(child: ChatRoom(userID: userID, roomID: roomID)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
