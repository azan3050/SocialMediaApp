import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurentUser;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Card(
          color: (isCurentUser ? Colors.grey.shade200 : Colors.indigo.shade100),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      //fontStyle: FontStyle.italic,
                      //decoration: TextDecoration.underline,
                      color: Colors.black,
                    )),
              ],
            ),
          )),
    );
  }
}
