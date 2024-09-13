// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? imageURl;  
  final String? phone;  
  final String? email;  
  final  Object? id;
  const User({
    this.name,
    this.imageURl,
    this.phone,
    this.email,
      this.id,
  });
  

  User copyWith({
    String? name,
    String? imageURl,
    String? phone,
    String? email,
    Object? id,
  }) {
    return User(
      name: name ?? this.name,
      imageURl: imageURl ?? this.imageURl,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageURl': imageURl,
      'phone': phone,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] != null ? map['name'] as String : null,
      imageURl: map['imageURl'] != null ? map['imageURl'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
     );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      imageURl,
      phone,
      email,
      id,
    ];
  }
}
