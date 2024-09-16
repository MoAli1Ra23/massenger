import 'package:massenger/features/profile/data/model/profile_model.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';

abstract class ProfileMapper {
 static ProfileModel formDomain(Profile p) {
    return ProfileModel(
      id: p.id,
      userId: p.userId,
      email: p.email,
      name: p.name,
      phone: p.phone,
      imagepathe: p.imagepathe,
    );
  }
}
