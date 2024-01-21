// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riyal_talks/chat/chat_bubble.dart';
import 'package:riyal_talks/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String recieversEmail;
  final String recieversId;

  const ChatPage(
      {super.key, required this.recieversEmail, required this.recieversId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500));
        () => scrollToBottom();
      }
    });
    Future.delayed(Duration(milliseconds: 500));
    () => scrollToBottom();
  }

  final ScrollController _scrollController = ScrollController();

  void scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    if (_messageController.text.toString().isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieversId, _messageController.text.toString());
      _messageController.clear();
    }

    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: Border(
        //     bottom:
        //         BorderSide(color: Color.fromARGB(29, 19, 18, 19), width: 2)),
        elevation: 4,
        backgroundColor: Colors.indigo.shade200,
        title: Text(widget.recieversEmail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // _buildMessageDate(DateTime.now()),
            Expanded(
              child: _buildMessageList(),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(75, 224, 227, 227)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                controller: _messageController,
                focusNode: myFocusNode,
                obscureText: false,
                decoration: const InputDecoration(hintText: ' Enter Message'),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                  color: Colors.indigo.shade200,
                ),
                child: IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.send_outlined,
                      size: 40,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.recieversId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          }

          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  Widget _buildMessageDate(DateTime messageTime) {
    final DateFormat dateFormat = DateFormat('EEE, MMM d');
    final String formattedDate = dateFormat.format(messageTime);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(formattedDate),
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    bool isCurrentUser = (data['senderId'] == _firebaseAuth.currentUser!.uid);

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    // Code to display time below chat bubble
    final DateTime messageTime = data['timestamp'].toDate();
    final String formattedTimeStamp = DateFormat.jm().format(messageTime);

    //code to display date
    List<Widget> messageItems = [];
    DateTime? previousMessageTime;

    if (previousMessageTime == null ||
        !DateUtils.isSameDay(previousMessageTime, messageTime)) {
      previousMessageTime = messageTime;
      messageItems.add(_buildMessageDate(messageTime));
    }

    // messages UI
    return Column(
      children: [
        Container(
          alignment: alignment,
          child: Column(
            crossAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              //Text(data['senderEmail']),
              ChatBubble(
                message: data['message'],
                isCurentUser: isCurrentUser,
              ),
              Row(
                mainAxisAlignment:
                    (data['senderId'] == _firebaseAuth.currentUser!.uid)
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                children: [Text(formattedTimeStamp), ...messageItems],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
