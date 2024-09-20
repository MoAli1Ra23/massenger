// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';

import 'package:massenger/features/authentication/domain/entity/user.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:massenger/injection.dart';

class AuthManger extends StateNotifier<AuthState> {
  AuthManger() : super(const AuthState(user: null));

  Future<void> checkAutheState() async {
    Either<Failure, User> currentUserOption =
        await getIt.get<Auth>().getCurrentUser();
    currentUserOption.fold(
      (_) => state = state.copyWith(user: null),
      (u) => state = state.copyWith(user: u),
    );
  }
}

class AuthState extends Equatable {
  final User? user;
  const AuthState({
    this.user,
  });

  @override
  List<Object?> get props => [user];

  AuthState copyWith({
    User? user,
  }) {
    return AuthState(
      user: user ?? this.user,
    );
  }
}
