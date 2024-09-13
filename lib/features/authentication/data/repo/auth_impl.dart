import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/core/func/user_converter.dart';
import 'package:massenger/core/value_object/email.dart';
import 'package:massenger/core/value_object/password.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/injection.dart';
import 'package:massenger/features/authentication/domain/entity/user.dart'
    as domain;

@LazySingleton(as: Auth, env: [Environment.dev, Environment.prod])
class AuthImpl extends Auth {
  @override
  Future<Option<Failure>> createAcccontWithEmail(
      Email email, Password pass) async {
    try {
      final es = email.getOrCrash();
      final ps = pass.getOrCrash();
      await getIt
          .get<FirebaseAuth>()
          .createUserWithEmailAndPassword(email: es, password: ps);
      return none();
    } catch (e) {
      return Some(AuthFailure());
    }
  }

  @override
  Future<Option<Failure>> loginWithEmail(Email email, Password pass) async {
    final es = email.getOrCrash();
    final ps = pass.getOrCrash();
    try {
      await getIt
          .get<FirebaseAuth>()
          .signInWithEmailAndPassword(email: es, password: ps);
      return none();
    } catch (e) {
      return Some(AuthFailure());
    }
  }

  @override
  Future<Option<domain.User>> getCurrentUser() async {
    var firebaseAuth = getIt.get<FirebaseAuth>();

    User? user = firebaseAuth.currentUser;
    return optionOf(await firebaseAuth.toDomain(user));
  }
}
