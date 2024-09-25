import 'package:injectable/injectable.dart';
import 'package:massenger/core/services/app_db.dart';
import 'package:massenger/core/utils/const_value.dart';
import 'package:massenger/features/profile/data/data_source/profile_local.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';

@LazySingleton(as: ProfileLocal,env: [Environment.dev,Environment.prod])
class ProfileLocalDataSource extends ProfileLocal {
  final AppDb appDb;

  ProfileLocalDataSource(this.appDb);

  @override
  Future<ProfileModel> getOneProfiles(String userId) async {
    return (await getCashedProfiles()).where((x) => x.userId == userId).first;
  }

  @override
  Future<List<ProfileModel>> getCashedProfiles() async {
    var r = await appDb.readDate(ConstValue.profile);
    return r.map((c) => ProfileModel.fromMap(c)).toList();
  }

  @override
  Future<void> cacheProfiles(List<ProfileModel> sl) {
    return Future.wait(sl
        .map((profile) => appDb.insert(ConstValue.profile, profile.toMap()))
        .toList());
  }

  @override
  Future<void> setOneProfiles(ProfileModel profile) async {
    await appDb.insert(ConstValue.profile, profile.toMap());
  }
}
