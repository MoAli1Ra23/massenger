// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/services/firebase_auth.dart' as _i909;
import 'features/authentication/data/repo/auth_impl.dart' as _i856;
import 'features/authentication/domain/repo/auth.dart' as _i181;

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
  gh.singleton<_i59.FirebaseAuth>(() => firebaseAuths.auth());
  gh.lazySingleton<_i181.Auth>(
    () => _i856.AuthImpl(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return getIt;
}

class _$FirebaseAuths extends _i909.FirebaseAuths {}
