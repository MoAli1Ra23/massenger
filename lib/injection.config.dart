// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/services/firebase_auth.dart' as _i909;
import 'core/services/firebase_store.dart' as _i789;
import 'features/authentication/data/repo/auth_impl.dart' as _i856;
import 'features/authentication/domain/repo/auth.dart' as _i181;
import 'features/chat/data/datasource/message_data_source.dart' as _i341;
import 'features/chat/data/datasource/message_firestore_impl.dart' as _i1011;
import 'features/chat/data/repo/messege_repo_impl.dart' as _i807;
import 'features/chat/domain/repo/message_repo.dart' as _i234;
import 'features/profile/data/data_source/profile_data_source.dart' as _i642;
import 'features/profile/data/data_source/profile_fire_data_source.dart'
    as _i592;
import 'features/profile/data/repo/profile_repo_impl.dart' as _i475;
import 'features/profile/domain/repo/profile_repo.dart' as _i973;

const String _dev = 'dev';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseAuths = _$FirebaseAuths();
  final firebaseStore = _$FirebaseStore();
  gh.singleton<_i59.FirebaseAuth>(() => firebaseAuths.auth());
  gh.singleton<_i974.FirebaseFirestore>(() => firebaseStore.fire());
  gh.lazySingleton<_i341.MessageDataSource>(
    () => _i1011.MessageFirestoreImpl(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i234.MessageRepo>(
    () => _i807.MessegeRepoImpl(gh<_i341.MessageDataSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i181.Auth>(
    () => _i856.AuthImpl(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i642.ProfileDataSource>(
    () => _i592.ProfileFireDataSource(store: gh<_i974.FirebaseFirestore>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i973.ProfileRepo>(
    () => _i475.ProfileRepoImpl(dataSource: gh<_i642.ProfileDataSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return getIt;
}

class _$FirebaseAuths extends _i909.FirebaseAuths {}

class _$FirebaseStore extends _i789.FirebaseStore {}
