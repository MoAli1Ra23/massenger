import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Profile?>> getprofile(String userid);
  Future<Option<Failure>> updateprofile(Profile profile);
  Future<Option<Failure>> createProfile(Profile profile);
  Future<Either<Failure,List<Profile>>>  readProfileList( );
}
