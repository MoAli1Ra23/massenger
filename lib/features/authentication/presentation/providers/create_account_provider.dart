import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:massenger/core/value_object/email.dart';
import 'package:massenger/core/value_object/password.dart';

class CreateAccountProvider extends StateNotifier<CreateAccount> {
  CreateAccountProvider()
      : super(CreateAccount(
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

  void onSub() {
    if (state.isSubmitting) return;
    state = state.copyWith(isSubmitting: true);
  }
}

class CreateAccount extends Equatable {
  final Email email;
  final Password password;
  final bool showErr;
  final bool isSubmitting;
  const CreateAccount({
    required this.email,
    required this.password,
    required this.showErr,
    required this.isSubmitting,
  });

  CreateAccount copyWith({
    Email? email,
    Password? password,
    bool? showErr,
    bool? isSubmitting,
  }) {
    return CreateAccount(
      email: email ?? this.email,
      password: password ?? this.password,
      showErr: showErr ?? this.showErr,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password, showErr, isSubmitting];
}
