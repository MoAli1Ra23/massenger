// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/services/app_db.dart' as _i726;
import 'core/services/firebase_auth.dart' as _i909;
import 'core/services/firebase_store.dart' as _i789;
import 'core/services/my_firebase_storage.dart' as _i636;
import 'core/services/net_work_service.dart' as _i608;
import 'features/authentication/data/repo/auth_impl.dart' as _i856;
import 'features/authentication/domain/repo/auth.dart' as _i181;
import 'features/chat/data/datasource/chats_data_source.dart/chats_data_repo.dart'
    as _i316;
import 'features/chat/data/datasource/chats_data_source.dart/chats_data_repo_impl.dart'
    as _i984;
import 'features/chat/data/datasource/message_data_source.dart' as _i341;
import 'features/chat/data/datasource/message_firestore_impl.dart' as _i1011;
import 'features/chat/data/repo/chat_repo_impl.dart' as _i1027;
import 'features/chat/data/repo/messege_repo_impl.dart' as _i807;
import 'features/chat/domain/repo/chat_repo.dart' as _i164;
import 'features/chat/domain/repo/message_repo.dart' as _i234;
import 'features/network/data/repo/net_repo_impl.dart' as _i993;
import 'features/network/domain/repo/net_repo.dart' as _i806;
import 'features/profile/data/data_source/profile_data_source.dart' as _i642;
import 'features/profile/data/data_source/profile_fire_data_source.dart'
    as _i592;
import 'features/profile/data/data_source/profile_local.dart' as _i87;
import 'features/profile/data/data_source/profile_local_data_source.dart'
    as _i78;
import 'features/profile/data/repo/profile_repo_impl.dart' as _i475;
import 'features/profile/domain/repo/profile_repo.dart' as _i973;
import 'features/uploder/data/repo/image_file_repo.dart' as _i964;
import 'features/uploder/data/storage_source/firebase_storage_source.dart'
    as _i42;
import 'features/uploder/data/storage_source/storage_source.dart' as _i262;
import 'features/uploder/domain/repo/image_file_repo.dart' as _i693;

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
  final myFirebaseStorage = _$MyFirebaseStorage();
  final netWorkService = _$NetWorkService();
  gh.singleton<_i59.FirebaseAuth>(() => firebaseAuths.auth());
  gh.singleton<_i974.FirebaseFirestore>(() => firebaseStore.fire());
  gh.lazySingleton<_i457.FirebaseStorage>(() => myFirebaseStorage.storage());
  gh.lazySingleton<_i895.Connectivity>(() => netWorkService.connectivty());
  gh.lazySingleton<_i316.ChatsDataRepo>(
    () => _i984.ChatsDataRepoImpl(gh<_i974.FirebaseFirestore>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i164.ChatRepo>(
    () => _i1027.ChatRepoImpl(gh<_i316.ChatsDataRepo>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
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
  gh.lazySingleton<_i726.AppDb>(
    () => _i726.AppDb(),
    registerFor: {
      _prod,
      _dev,
    },
  );
  gh.lazySingleton<_i262.StorageSource>(
    () => _i42.FirebaseStorageSource(storage: gh<_i457.FirebaseStorage>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i806.NetRepo>(
      () => _i993.NetRepoImpl(connectivity: gh<_i895.Connectivity>()));
  gh.lazySingleton<_i693.ImageFileRepo>(
    () => _i964.ImageFileRepoImp(gh<_i262.StorageSource>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i87.ProfileLocal>(
    () => _i78.ProfileLocalDataSource(gh<_i726.AppDb>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i973.ProfileRepo>(
    () => _i475.ProfileRepoImpl(
      dataSource: gh<_i642.ProfileDataSource>(),
      local: gh<_i87.ProfileLocal>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return getIt;
}

class _$FirebaseAuths extends _i909.FirebaseAuths {}

class _$FirebaseStore extends _i789.FirebaseStore {}

class _$MyFirebaseStorage extends _i636.MyFirebaseStorage {}

class _$NetWorkService extends _i608.NetWorkService {}
