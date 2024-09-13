// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String text;
  final DateTime dateTime;
  final int? watchStatr;
  const Message({
    required this.text,
    required this.dateTime,
    this.watchStatr,
  });

  Message copyWith({
    String? text,
    DateTime? dateTime,
    int? watchStatr,
  }) {
    return Message(
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime,
      watchStatr: watchStatr ?? this.watchStatr,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'watchStatr': watchStatr,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      watchStatr: map['watchStatr'] != null ? map['watchStatr'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [text, dateTime, watchStatr];
}
