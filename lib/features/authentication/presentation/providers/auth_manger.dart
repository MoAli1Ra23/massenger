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
        (f) => state = state.copyWith(user: null, failure: f),
        (u) => state = state.copyWith(user: u,failure: null));
  }
  Future<void> sighnOut() async {
            await getIt.get<Auth>().sighnOut();

state = state.copyWith(user: null, failure: null);
  }
}

class AuthState extends Equatable {
  final User? user;

  final Failure? failure;
  const AuthState({this.user, this.failure});

  @override
  List<Object?> get props => [user, failure];

  AuthState copyWith({User? user, Failure? failure}) {
    return AuthState(user: user ?? this.user, failure: failure ?? this.failure);
  }
}
