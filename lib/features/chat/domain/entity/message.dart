// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:massenger/features/authentication/domain/entity/user.dart';

class Message extends Equatable {
  final String text;
  final DateTime dateTime;
  final int watchStatr;
  final String? imgeUrl;
  final User? user;
  final String? id;
  const Message({
    required this.text,
    required this.dateTime,
    this.watchStatr=0,
    this.imgeUrl,
    this.user,
    this.id,
  });

  Message copyWith({
    String? text,
    DateTime? dateTime,
    int? watchStatr,
    String? imgeUrl,
    User? user,
    String? id,
  }) {
    return Message(
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime,
      watchStatr: watchStatr ?? this.watchStatr,
      imgeUrl: imgeUrl ?? this.imgeUrl,
      user: user ?? this.user,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'watchStatr': watchStatr,
      'imgeUrl': imgeUrl,
      'user': user?.toMap(),
      'id': id,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      watchStatr: map['watchStatr'] as int,
      imgeUrl: map['imgeUrl'] != null ? map['imgeUrl'] as String : null,
      user: map['user'] != null ? User.fromMap(map['user'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as  String  : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      text,
      dateTime,
      watchStatr,
      imgeUrl,
      user,
      id,
    ];
  }
}
