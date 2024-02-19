import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, required this.userID, required this.roomID});

  final String userID;
  final String roomID;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  final _store = FirebaseFirestore.instance;

  var userEnteringText = '';

  void sendMessage() {
    _store
        .collection('chatRooms/${widget.roomID}/chats')
        .add({
      'text': userEnteringText,
      'time': FieldValue.serverTimestamp(),
      'userID': widget.userID,
    });
    _store
        .collection('chatRooms')
        .doc(widget.roomID)
        .update({'time': FieldValue.serverTimestamp()});
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: null,
            controller: _controller,
            onChanged: (value) {
              setState(() {
                userEnteringText = value;
              });
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius:
                    BorderRadius.all(Radius.circular(screenHeight * 0.012)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius:
                    BorderRadius.all(Radius.circular(screenHeight * 0.012)),
              ),
              hintText: 'Send your message',
              hintStyle: const TextStyle(
                color: Colors.white70,
                fontFamily: 'Geo',
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.035,
              ),
              filled: true,
              fillColor: Colors.white12,
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Geo',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: userEnteringText.trim().isEmpty ? null : sendMessage,
          icon: const Icon(Icons.send),
          color: const Color(0xFF9E67DA),
        ),
      ],
    );
  }
}
