import 'package:massenger/features/profile/data/model/profile_model.dart';

abstract class ProfileLocal {
  Future<List<ProfileModel>> getCashedProfiles();
  Future<ProfileModel?> getOneProfiles(String userId);
  Future<void> setOneProfiles(ProfileModel profile);
  Future<void> cacheProfiles(List<ProfileModel> sl);
}
