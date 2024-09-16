import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/data/data_source/profile_data_source.dart';
import 'package:massenger/features/profile/data/mapper/profile_mapper.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';
 import 'package:massenger/features/profile/domain/entity/profile.dart';
import 'package:massenger/features/profile/domain/repo/profile_repo.dart';
@LazySingleton(as: ProfileRepo,env: [Environment.dev,Environment.prod])
class ProfileRepoImpl extends ProfileRepo{
  final  ProfileDataSource dataSource;

  ProfileRepoImpl({required this.dataSource});
  @override
  Future<Option<Failure>> createProfile(Profile profile) {
    return dataSource.add(ProfileMapper.formDomain(profile));
   
  }

  @override
  Future<Either<Failure, Profile?>> getprofile(String userid) {

    return dataSource.get(userid);
  }

  @override
  Future<Option<Failure>> updateprofile(Profile profile) {

        return dataSource.update(profile as ProfileModel);

  }
}