import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';

import 'package:massenger/core/value_object/email.dart';
import 'package:massenger/core/value_object/password.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:massenger/injection.dart';

class CreateAccountProvider extends StateNotifier<CreateAccount> {
  CreateAccountProvider()
      : super(CreateAccount(
            isSubmitted: false,
            submittingFailure: null,
            email: Email(""),
            showErr: false,
            isSubmitting: false,
            password: Password("")));
  void emailChange(String s) {
    state = state.copyWith(showErr: true, email: Email(s));
  }

  void passChange(String s) {
    state = state.copyWith(showErr: true, password: Password(s));
  }

  Future<void> onSingUp() async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);

    var x = await getIt
        .get<Auth>()
        .createAcccontWithEmail(state.email, state.password);
    x.fold(
        () =>
            state = state.copyWith(submittingFailure: null, isSubmitted: true),
        (f) => state = state.copyWith(
              submittingFailure: f,
            ));
  }
  Future<void> onSingIn() async {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);

    var x = await getIt
        .get<Auth>()
        .loginWithEmail(state.email, state.password);
    x.fold(
        () =>
            state = state.copyWith(submittingFailure: null, isSubmitted: true),
        (f) => state = state.copyWith(
              submittingFailure: f,
            ));
  }


}

class CreateAccount extends Equatable {
  final Failure? submittingFailure;

  final Email email;
  final Password password;
  final bool showErr;
  final bool isSubmitting;
  final bool isSubmitted;
  const CreateAccount({
    required this.email,
    required this.submittingFailure,
    required this.isSubmitted,
    required this.password,
    required this.showErr,
    required this.isSubmitting,
  });

  CreateAccount copyWith({
    Email? email,
    Password? password,
    bool? showErr,
    bool? isSubmitted,
    bool? isSubmitting,
    Failure? submittingFailure,
  }) {
    return CreateAccount(
      email: email ?? this.email,
      submittingFailure: submittingFailure ?? this.submittingFailure,
      password: password ?? this.password,
      showErr: showErr ?? this.showErr,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [email, password, showErr, isSubmitting, submittingFailure, isSubmitted];
}
