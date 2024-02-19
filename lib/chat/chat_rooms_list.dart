import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomsList extends StatefulWidget {
  const ChatRoomsList({super.key});

  @override
  State<ChatRoomsList> createState() => _ChatRoomsListState();
}

class _ChatRoomsListState extends State<ChatRoomsList> {
  final _store = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  User? loggedUser;
  final debugControl = false;

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
    if (debugControl) {
      return const Placeholder();
    } else {
      if (loggedUser != null) {
        return StreamBuilder(
          stream: _store
              .collection('user')
              .doc(loggedUser!.uid)
              .collection('chatRooms')
              .snapshots(),
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
                  title: Text(chatRoom['name']),
                  onTap: () {},
                );
              },
            );
          },
        );
      }
      return const Placeholder();
    }
  }
}
