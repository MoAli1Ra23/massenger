import 'package:firebase_auth/firebase_auth.dart' as auth;
 
import 'package:massenger/features/authentication/domain/entity/user.dart';
 
extension UserConverter on auth.FirebaseAuth {
  Future<User?> toDomain (auth. User? user ) async {
 
    User? u = User(email: user?.email, imageURl: user?.photoURL);
    return u;
  }
}
