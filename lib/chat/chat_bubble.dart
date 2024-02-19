import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.text, required this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenRatio = screenHeight / screenWidth;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () {}, // 챗버블 길게 누를 시의 기능 구현 필요
          child: Container(
            decoration: BoxDecoration(
              color: !isMe
                  ? Color.fromRGBO(230, 230, 255, 1)
                  : Color.fromRGBO(150, 150, 255, 1),
              borderRadius:
                  BorderRadius.all(Radius.circular(screenHeight * 0.012)),
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.012,
              horizontal: screenWidth * 0.03,
            ),
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.006),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
                fontFamily: 'Geo',
                fontWeight: FontWeight.bold,
              ),
              textAlign: isMe ? TextAlign.end : TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
