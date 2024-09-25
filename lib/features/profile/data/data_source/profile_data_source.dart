 import 'package:dartz/dartz.dart';
 import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';
 
abstract class ProfileDataSource {
  Future<Option<Failure>> add(ProfileModel p);
  Future<Option<Failure>> update(ProfileModel p);
  Future<Either<Failure, ProfileModel?>> get(String userid);
  Future<Either<Failure, List<ProfileModel>>> getAll();

}
