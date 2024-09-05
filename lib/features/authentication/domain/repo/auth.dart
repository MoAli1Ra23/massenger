import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/core/value_object/email.dart';
import 'package:massenger/core/value_object/password.dart';

abstract class Auth {
  Future<Option<Failure>> createAcccontWithEmail(Email email, Password pass);
  Future<Option<Failure>> loginWithEmail(Email email, Password pass);
}
