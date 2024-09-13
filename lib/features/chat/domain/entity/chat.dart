// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String userid;
  final String perternid;
  const Chat({
    required this.userid,
    required this.perternid,
  });

  Chat copyWith({
    String? userid,
    String? perternid,
  }) {
    return Chat(
      userid: userid ?? this.userid,
      perternid: perternid ?? this.perternid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'perternid': perternid,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      userid: map['userid'] as String,
      perternid: map['perternid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [userid, perternid];
}
