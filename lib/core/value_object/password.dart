import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/core/value_object/value_object.dart';

class Password extends ValueObject<String> {
  factory Password(String password) {
    var val = validatepassword(password);
    Failure? f;
    String? right;
    val.fold(
      (l) => f = l,
      (r) => right = r,
    );

    return Password._(
      val,
      val.isRight(),
      right,
      f,
    );
  }
  const Password._(super.value, super.isValide, super.right, super.failure);
}

Either<Failure, String> validatepassword(String password) {
  if (password.length<4) {
    return left(TooShortPassWord());
  }
  return Right(password);
}
