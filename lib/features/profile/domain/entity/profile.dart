// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
// 01018717041
class Profile extends Equatable {
  final String? id;
  final String? userId;
  final String? email;
  final String? phone;

  final String? name;
  final String? imagepathe;
  const Profile({
    this.id,
    required this.userId,
    this.email,
    this.phone,
    this.name,
    this.imagepathe,
  });

  Profile copyWith({
    String? id,
    String? userId,
    String? email,
    String? phone,
    String? name,
    String? imagepathe,
  }) {
    return Profile(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      imagepathe: imagepathe ?? this.imagepathe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'email': email,
      'phone': phone,
      'name': name,
      'imagepathe': imagepathe,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      imagepathe: map['imagepathe'] != null ? map['imagepathe'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      email,
      phone,
      name,
      imagepathe,
    ];
  }
}
