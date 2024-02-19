import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({super.key, required this.userID, required this.roomID});
  final String userID;
  final String roomID;

  final _store = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final String pathInFirebase = 'users/$userID/chatRooms/$roomID/chats';

    return Center(
      child: StreamBuilder(
        stream: _store.collection(pathInFirebase).orderBy('time').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final messages = snapshot.data!.docs;

          return ListView.builder(itemCount: messages.length, itemBuilder: (context, index) {
            return const Placeholder();
          });
        },
      )
    );
  }
}
