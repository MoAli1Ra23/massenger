// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:massenger/core/error/failure.dart';

abstract class ValueObject<T> extends Equatable {
  final Either<Failure, T> value;
  final bool? isValide;
  final T? right;
  final Failure? failure;

  const ValueObject(
    this.value,
    this.isValide,
    this.right,
    this.failure,
  );

  @override
  List<Object?> get props => [value, isValide, right, failure];
}
