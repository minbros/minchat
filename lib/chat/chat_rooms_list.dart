import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minchat/screens/chat_page.dart';

class ChatRoomsList extends StatefulWidget {
  const ChatRoomsList({super.key});

  @override
  State<ChatRoomsList> createState() => _ChatRoomsListState();
}

class _ChatRoomsListState extends State<ChatRoomsList> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  User? loggedUser;

  @override
  void initState() {
    // state가 초기화될 때마다 실행되는 메소드
    super.initState();
    getCurrentUser();
    // 즉 state가 초기화될 때마다 getCurrentUser 메소드를 실행함
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        debugPrint(loggedUser!.uid);
        // loggedUser에 대한 null check 진행
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _store.collection('chatRooms').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final chatRooms = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatRooms.length,
          itemBuilder: (context, index) {
            final chatRoom = chatRooms[index];

            return ListTile(
              title: Text(
                chatRoom['name'],
                style: const TextStyle(
                  fontFamily: 'Geo',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Modify it',
                style: const TextStyle(
                  fontFamily: 'Geo',
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                          userID: loggedUser!.uid,
                          roomID: chatRoom.id,
                        )));
              },
            );
          },
        );
      },
    );
  }
}
