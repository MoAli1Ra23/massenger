import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/core/value_object/value_object.dart';

class Email extends ValueObject<String> {
  factory Email(String email) {
    var val = validateMail(email);
    Failure? f;
    String? right;
    val.fold((l) => f = l, (r) => right = r);

    return Email._(val, val.isRight(), right, f);
  }
  const Email._(super.value, super.isValide, super.right, super.failure);
}

Either<Failure, String> validateMail(String email) {
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
    return left(BadEmailFormate());
  }
  return Right(email);
}
