import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String recieverId;
  final String senderEmail;
  final String message;
  final Timestamp timestamp;
  final String formattedTimeStamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.message,
      required this.recieverId,
      required this.timestamp,
      required this.formattedTimeStamp});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recieverId': recieverId,
      'message': message,
      'timestamp': timestamp,
      'formattedTimeStamp': formattedTimeStamp
    };
  }
}
