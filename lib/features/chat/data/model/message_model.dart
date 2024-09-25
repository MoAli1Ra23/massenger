import 'dart:convert';

import 'package:massenger/features/chat/domain/entity/message.dart';

class MessageModel extends Message {
  final String? userId;
  const MessageModel(
      {this.userId,
      super.imgeUrl,
      super.id,
      super.watchStatr,
      required super.text,
      required super.dateTime});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'watchStatr': watchStatr,
      'imgeUrl': imgeUrl,
      'userid': user?.id,
      'id': id,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      text: map['text'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      watchStatr: map['watchStatr'] as int,
      imgeUrl: map['imgeUrl'] != null ? map['imgeUrl'] as String : null,
      userId:map['userid'] !=null?  map['userid'] as String:"0",
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        text,
        dateTime,
        watchStatr,
        userId,
        user,
        imgeUrl,
      ];
}
