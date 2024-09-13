import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:massenger/core/services/firebase_auth.dart';

import 'package:massenger/features/authentication/domain/entity/user.dart';
 import 'package:massenger/injection.dart';

extension FirebaseAuthX on auth.FirebaseAuth {
  Future<User?> toDomain(auth.User? user) async {
    return user != null
        ? User(
            id: user.uid,
            email: user.email,
            imageURl: user.photoURL,
            phone: user.phoneNumber,
            name: user.displayName)
        : null;
  }

  auth.User? gerCurrentUser() {
    return getIt.get<FirebaseAuths>().auth().currentUser;
  }
}
