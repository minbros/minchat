import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minchat/config/customs.dart';
import 'package:minchat/config/palette.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return StreamBuilder(
      stream: _store
          .collection('chatRooms')
          .where('participants', arrayContains: _auth.currentUser!.uid)
          .orderBy('time', descending: true)
          .snapshots(),
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

        // if (!snapshot.hasData) {
        //   return const Center(
        //     child: Text(
        //       'Start your new chat right now!',
        //       style: TextStyle(
        //         fontFamily: 'Geo',
        //         color: Colors.white,
        //       ),
        //     ),
        //   );
        // }

        final chatRooms = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatRooms.length,
          itemBuilder: (context, index) {
            final chatRoom = chatRooms[index];

            return ListTile(
              leading: Icon(
                Icons.account_circle,
                size: screenHeight * 0.05,
                color: Palette.appBarIconColor,
              ),
              title: Text(
                chatRoom['name'],
                style: TextStyle(
                  fontFamily: 'Geo',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              subtitle: Text(
                'Modify it',
                style: TextStyle(
                  fontFamily: 'Geo',
                  color: Colors.white,
                  fontSize: screenHeight * 0.015,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                          userID: loggedUser!.uid,
                          roomID: chatRoom.id,
                        )));
              },
              onLongPress: () {
                showModalBottomSheet(
                  backgroundColor: Palette.bottomSheetBackgroundColor,
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: Wrap(
                        children: [
                          Center(
                            child: Container(
                              width: screenWidth * 0.2,
                              height: 5,
                              margin: EdgeInsets.only(
                                  top: screenHeight * 0.01,
                                  bottom: screenHeight * 0.005),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(screenHeight * 0.012))),
                            ),
                          ),
                          ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text(
                                'Edit a name',
                                style: TextStyle(fontFamily: 'Geo'),
                              ),
                              onTap: () {
                                // 이름 변경 구현 필요
                                Navigator.pop(context);
                              }),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text(
                              'Delete',
                              style: TextStyle(fontFamily: 'Geo'),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CustomErrorAlertDialog(
                                    text: 'Are you sure you want to delete?',
                                    height: screenHeight,
                                    actions: [
                                      SizedBox(
                                        height: screenHeight * 0.035,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(screenHeight * 0.012),
                                            ),
                                          ),
                                          child: const Text(
                                            'NO',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      SizedBox(
                                        height: screenHeight * 0.035,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _store.doc('chatRooms/${chatRoom.id}').delete();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff6c72e6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(screenHeight * 0.012),
                                            ),
                                          ),
                                          child: const Text(
                                            'YES',
                                            style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    actionsAlignment: MainAxisAlignment.center,
                                    // actionsPadding: EdgeInsets.only(bottom: screenHeight * 0.02),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void showDeleteAlertDialog(BuildContext context, double height) {

  }
}
