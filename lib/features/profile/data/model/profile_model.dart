import 'package:massenger/features/profile/domain/entity/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.userId,
    required super.email,
    required super.name,
    required super.phone,
    required super.imagepathe,
  });
  @override
  ProfileModel copyWith({
    String? id,
    String? userId,
    String? email,
    String? phone,
    String? name,
    String? imagepathe,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      imagepathe: imagepathe ?? this.imagepathe,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'email': email,
      'phone': phone,
      'name': name,
      'imagepathe': imagepathe,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      imagepathe:
          map['imagepathe'] != null ? map['imagepathe'] as String : null,
    );
  }
}
