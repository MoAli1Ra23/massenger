 

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:massenger/core/error/failure.dart';

abstract class ValueObject<T> extends Equatable {
  final Either<Failure, T> value;
  final bool? isValide;
  final T? right;
  T getOrCrash()=>value.fold((f)=>throw UnexpectedValueError(f), (r)=>r);
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

class UnexpectedValueError extends Error {
 final Failure failure;
  UnexpectedValueError(
      this.failure,
  );


  UnexpectedValueError copyWith({
    Failure? failure,
  }) {
    return UnexpectedValueError(
     failure ?? this.failure,
    );
  }
 
  @override
  bool operator ==(covariant UnexpectedValueError other) {
    if (identical(this, other)) return true;
  
    return 
      other.failure == failure;
  }

  @override
  int get hashCode => failure.hashCode;
}
