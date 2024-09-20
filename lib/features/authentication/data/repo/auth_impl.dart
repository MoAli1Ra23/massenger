import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/core/func/user_converter.dart';
import 'package:massenger/core/value_object/email.dart';
import 'package:massenger/core/value_object/password.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/features/network/domain/repo/net_repo.dart';
import 'package:massenger/injection.dart';
import 'package:massenger/features/authentication/domain/entity/user.dart'
    as domain;

@LazySingleton(as: Auth, env: [Environment.dev, Environment.prod])
class AuthImpl extends Auth {
  @override
  Future<Either<Failure, domain.User>> createAcccontWithEmail(
      Email email, Password pass) async {
    var net = await getIt.get<NetRepo>().check();
    if (!net.isConnected) {
      return left(ConnectionFailure());
    } else {
      var firebaseAuth = getIt.get<FirebaseAuth>();
      try {
        final es = email.getOrCrash();
        final ps = pass.getOrCrash();
        var u = await getIt
            .get<FirebaseAuth>()
            .createUserWithEmailAndPassword(email: es, password: ps);
        return Right((await firebaseAuth.toDomain(u.user))!);
      } catch (e) {
        return Left(AuthFailure());
      }
    }
  }

  @override
  Future<Option<Failure>> loginWithEmail(Email email, Password pass) async {
    final es = email.getOrCrash();
    final ps = pass.getOrCrash();
    var net = await getIt.get<NetRepo>().check();
    if (!net.isConnected) return Some(ConnectionFailure());
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
  Future<Either<Failure,domain.User>> getCurrentUser() async {
    var firebaseAuth = getIt.get<FirebaseAuth>();
 var net = await getIt.get<NetRepo>().check();
    if (!net.isConnected) {
      return left(ConnectionFailure());
    } else {
    User? user = firebaseAuth.currentUser;
     domain.User? usr = await firebaseAuth.toDomain(user);
    return usr!=null? Right(usr):Left(AuthFailure());
     }
  }
}
