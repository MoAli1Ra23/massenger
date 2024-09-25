import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/network/domain/repo/net_repo.dart';
import 'package:massenger/features/profile/data/data_source/profile_data_source.dart';
import 'package:massenger/features/profile/data/model/profile_model.dart';
import 'package:massenger/injection.dart';

@LazySingleton(as: ProfileDataSource, env: [Environment.dev, Environment.prod])
class ProfileFireDataSource extends ProfileDataSource {
  final FirebaseFirestore store;

  ProfileFireDataSource({required this.store});
  @override
  Future<Option<Failure>> add(ProfileModel p) async {
    try {
      await getProfileFireStoreCollection().add(p.toMap());
      return none();
    } catch (e) {
      return Some(BadEmailFormate());
    }
  }

  @override
  Future<Either<Failure, ProfileModel?>> get(String userid) async {
    try {
      var r = await getProfileFireStoreCollection()
          .where(
            "userid",
            isEqualTo: userid
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
      await getProfileFireStoreCollection().doc(p.id).set(p.toMap());
      return none();
    } catch (e) {
      return Some(BadEmailFormate());
    }
  }

  @override
  Future<Either<Failure, List<ProfileModel>>> getAll() async {
    var con= await getIt.get<NetRepo>().check();
    if(!con.isConnected) return Left(ConnectionFailure());
    try{
    return getProfileFireStoreCollection()
        .get()
        .then((m) => right<Failure, List<ProfileModel>>(
            m.docs.map((m) => ProfileModel.fromMap(m.data())).toList()))
        .catchError(
          (s, x) => Left<Failure, List<ProfileModel>>(BadEmailFormate()),
        );
  } catch (e ) {
    return left(BadEmailFormate());
  }
  }

  CollectionReference<Map<String, dynamic>> getProfileFireStoreCollection() {
    return store
      .collection('Profiles');
  }
  
}
