import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minchat/chat/chat_rooms_list.dart';
import 'package:minchat/config/palette.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final _authentication = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

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
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        debugPrint(loggedUser!.email);
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
    double screenRatio = screenHeight / screenWidth;

    return Scaffold(
      extendBodyBehindAppBar: true, // appBar가 body 위로 오도록 함
      appBar: AppBar(
        automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Palette.appBarIconColor,
        ),
        // appBar의 배경색을 투명하게 지정해야 기존의 LinearGradient를 배경으로 쓸 수 있음
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.peopleGroup)),
          IconButton(
            onPressed: () {
              _store.collection('users').doc(loggedUser!.uid).collection('chatRooms').add({
                'name': 'Must modify it later',
                'time': Timestamp.now(),
              });
            },
            icon: const Icon(
              Icons.add_comment
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text(
                      'Are you sure you want to log out?',
                      textAlign: TextAlign.center,
                    ),
                    contentTextStyle: TextStyle(
                      fontSize: screenHeight * 0.018,
                      color: Colors.white,
                      fontFamily: 'Geo',
                    ),
                    // contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
                    backgroundColor: Palette.alertColor,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenHeight * 0.012),
                    ),
                    icon: Icon(
                      Icons.error,
                      size: screenHeight * 0.06,
                    ),
                    iconColor: const Color(0xd0540a0a),
                    actions: [
                      SizedBox(
                        height: screenHeight * 0.035,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _authentication.signOut();
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
                      SizedBox(width: screenWidth * 0.02),
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
                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    // actionsPadding: EdgeInsets.symmetric(horizontal: 20),
                  );
                },
              );
              // _authentication.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // 배경 그라데이션
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(201, 161, 255, 1),
              Color.fromRGBO(140, 173, 255, 1),
            ],
          ),
        ),
        padding: EdgeInsets.fromLTRB(
          (screenRatio >= 2) ? screenWidth * 0.05 : screenWidth * 0.1,
          screenHeight * 0,
          (screenRatio >= 2) ? screenWidth * 0.05 : screenWidth * 0.1,
          screenHeight * 0.05,
        ),
        child: const SafeArea(child: ChatRoomsList()),
      ),
    );
  }
}
