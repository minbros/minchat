import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minchat/chat/chat_bubble.dart';
import 'package:minchat/config/palette.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({super.key, required this.userID, required this.roomID});

  final String userID;
  final String roomID;

  final _store = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final String pathInFirebase = 'chatRooms/$roomID/chats';
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: StreamBuilder(
        stream: _store.collection(pathInFirebase).orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: screenHeight * 0.06,
                    color: Palette.errorColor,
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  const Text(
                    'An error occurred while loading the data.',
                    style: TextStyle(
                      fontFamily: 'Geo',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }

          final chatDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                  text: chatDocs[index]['text'],
                  isMe: chatDocs[index]['userID'] == userID);
            },
          );
        },
      ),
    );
  }
}
