// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/data/data_source/profile_data_source.dart';
import 'package:massenger/features/profile/data/data_source/profile_local.dart';
import 'package:massenger/features/profile/data/mapper/profile_mapper.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';
import 'package:massenger/features/profile/domain/repo/profile_repo.dart';

@LazySingleton(as: ProfileRepo, env: [Environment.dev, Environment.prod])
class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource dataSource;
  final ProfileLocal local;

  ProfileRepoImpl({
    required this.dataSource,
    required this.local,
  });
  @override
  Future<Option<Failure>> createProfile(Profile profile) async {
    var x = await dataSource.add(ProfileMapper.formDomain(profile));
    return x.fold(() {
      local.setOneProfiles(ProfileMapper.formDomain(profile));
      return none();
    }, (f) => Some(f));
  }

  @override
  Future<Either<Failure, Profile?>> getprofile(String userid) async {
    Profile? f=await local.getOneProfiles(userid);

    if(f==null){
 var  s= await dataSource.get(userid);
 return s.fold((f)=>Left(f), (p){
  local.setOneProfiles(p as ProfileModel);
  return Right(p);
 });
    }
     return Right(f);
  }

  @override
  Future<Option<Failure>> updateprofile(Profile profile) {
    return dataSource.update(profile as ProfileModel);
  }

  @override
  Future<Either<Failure,List<Profile>>> readProfileList() async {
    var x=  await local.getCashedProfiles();
    if(x.isEmpty) {
      var xx= await dataSource.getAll();
    return  xx.fold((f){return left(f);}, (lp) async {

        await local.cacheProfiles(lp);
        return Right(lp);
      });
    }else {
      return right( x);
    }
   }
}
