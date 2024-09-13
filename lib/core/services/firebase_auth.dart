import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

@module
abstract class FirebaseAuths {
  @singleton
  FirebaseAuth auth() => FirebaseAuth.instance;
}
