import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.username, this.isMe, {this.key});

  final String message;
  final bool isMe;
  final String username;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(username,style: TextStyle(fontWeight: FontWeight.bold,color: isMe? Colors.white:Colors.black),),
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.grey[100] : Colors.black,
                ),
                textAlign: isMe? TextAlign.end:TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// Color.fromRGBO(186, 217, 13, 0.5)
