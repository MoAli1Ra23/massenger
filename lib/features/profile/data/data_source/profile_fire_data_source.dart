import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/data/data_source/profile_data_source.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';

@LazySingleton(as: ProfileDataSource, env: [Environment.dev, Environment.prod])
class ProfileFireDataSource extends ProfileDataSource {
  final FirebaseFirestore store;

  ProfileFireDataSource({required this.store});
  @override
  Future<Option<Failure>> add(ProfileModel p) async {
    try {
      await store.collection('Profiles').add(p.toMap());
      return none();
    } catch (e) {
      return Some(BadEmailFormate());
    }
  }

  @override
  Future<Either<Failure, ProfileModel?>> get(String userid) async {
    try {
      var r = await store
          .collection('Profiles')
          .where(
            "userid",
            isEqualTo: userid,
          )
          .get();
      return right(r.docs.map((x) => ProfileModel.fromMap(x.data())).first);
    } catch (e) {
      return left(BadEmailFormate());
    }
  }

  @override
  Future<Option<Failure>> update(ProfileModel p) async {
    try {
      await store.collection('Profiles').doc(p.id).set(p.toMap());
      return none();
    } catch (e) {
      return Some(BadEmailFormate());
    }
  }
}
