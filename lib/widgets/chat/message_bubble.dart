import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.username, this.image, this.isMe, {this.key});

  final String message;
  final bool isMe;
  final String username;
  final String image;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.blue[900] : Colors.pink[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(16),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(16),
                ),
              ),
              width: 150,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    username,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isMe ? Colors.white : Colors.black),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.grey[100] : Colors.black,
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: isMe ? null : 120,
          top: 0,
          right: isMe ? 120 : null,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
// Color.fromRGBO(186, 217, 13, 0.5)
