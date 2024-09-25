// ignore_for_file: public_member_api_docs, sort_constructors_first
//read
//edit
// add  or update image
// edit display name
// edit phone

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';

import 'package:massenger/features/authentication/domain/entity/user.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';
import 'package:massenger/features/profile/domain/repo/profile_repo.dart';
import 'package:massenger/features/uploder/domain/entity/image_file.dart';
import 'package:massenger/features/uploder/domain/repo/image_file_repo.dart';
import 'package:massenger/injection.dart';

class ProfileManger extends StateNotifier<ProfileState> {
  ProfileManger(super.state);
  Future<void> start() async {
    Either<Failure, User> userOption = await getIt.get<Auth>().getCurrentUser();
    userOption.fold((_) {
      state = state.copyWith(erroMsg: "No user");
    }, (u) async {
      final x = await getIt.get<ProfileRepo>().getprofile(u.id!);
      var p = x.fold((c) => null, (f) => f);
      state = state.copyWith(
          user: u,
          profile: p,
          phone: p?.phone ,
          name: p?.name,
          imageUrl: p?.imagepathe ,
          email: p?.email);
    });
  }

  Future<void> imageUrlChange(String url) async {
    // var profile = state.profile!.copyWith(imagepathe: url);
    // var user = state.user!.copyWith(imageURl: url);
    var x = DateTime.timestamp().toString();
    ImageFile f = ImageFile(path: url, folder: "profiles/$x");
    var url2 = await getIt.get<ImageFileRepo>().uplodeImage(f);
    url2.fold((l) {
      // TODO:headle error;
    }, (r) {
      state = state.copyWith(imageUrl: r.url!, imagepathe: url);
    });
  }

  void nameChange(String name) {
    String? v = _validateName(name);
    if (v == null) {
      // var profile = state.profile!.copyWith(name: name);
      // var user = state.user!.copyWith(name: name);
      state = state.copyWith(
        name: name,
      );
    } else {
      state = state.copyWith(nameErr: v);
    }
  }

  void phoneChange(String phone) {
    var v = _validatePhone(phone);
    if (v == null) {
      // var profile = state.profile!.copyWith(phone: phone);
      // var user = state.user!.copyWith(phone: phone);
      state = state.copyWith(
        phone: phone,
      );
    } else {
      state = state.copyWith(phoneErr: v);
    }
  }

  String? _validateName(String? name) {
    if (name == null) return null;
    if (name.length < 2) return "short";
    return null;
  }

  String? _validatePhone(String? phone) {
    if (phone == null) return null;
    if (phone.length < 7) return "short";
    return null;
  }

  Future<void> confirme() async {
    var u = state.user;
    var s = state;
    Profile pp = state.profile!.copyWith(
        name: s.name != u!.name ? s.name : null,
        imagepathe: u.imageURl != s.imageUrl ? s.imageUrl : null);
    Future.wait([
      getIt.get<ProfileRepo>().updateprofile(pp),
      getIt.get<Auth>().updateUserDate(
            u.name != s.name ? s.name : null,
            u.imageURl != s.imageUrl ? s.imageUrl : null,
            null,
          ),
      start()
    ]);
  }

  void cancel() {
    var u = state.user;
    var p = state.profile;
    state = state.copyWith(
        user: u,
        profile: p,
        phone: p?.phone,
        name: p?.name,
        imageUrl: p?.imagepathe,
        email: p?.email);
  }
}

class ProfileState extends Equatable {
  final User? user;
  final String? erroMsg;

  final Profile? profile;
  final String? name;
  final String? nameErr;
  final String? email;
  final String? emailErr;
  final String? imagepathe;
  final String? imageUrl;
  final String? phone;
  final String? phoneErr;
  const ProfileState({
    this.user,
    this.erroMsg,
    this.profile,
    this.name,
    this.nameErr,
    this.email,
    this.emailErr,
    this.imagepathe,
    this.imageUrl,
    this.phone,
    this.phoneErr,
  });

  ProfileState copyWith({
    User? user,
    String? erroMsg,
    Profile? profile,
    String? imageUrl,
    String? name,
    String? nameErr,
    String? email,
    String? emailErr,
    String? imagepathe,
    String? phone,
    String? phoneErr,
  }) {
    return ProfileState(
      user: user ?? this.user,
      erroMsg: erroMsg ?? this.erroMsg,
      profile: profile ?? this.profile,
      name: name ?? this.name,
      nameErr: nameErr ?? this.nameErr,
      email: email ?? this.email,
      emailErr: emailErr ?? this.emailErr,
      imagepathe: imagepathe ?? this.imagepathe,
      imageUrl: imageUrl ?? this.imageUrl,
      phone: phone ?? this.phone,
      phoneErr: phoneErr ?? this.phoneErr,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      user,
      erroMsg,
      imageUrl,
      profile,
      name,
      nameErr,
      email,
      emailErr,
      imagepathe,
      phone,
      phoneErr,
    ];
  }
}
