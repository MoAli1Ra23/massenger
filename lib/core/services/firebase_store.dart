import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseStore {
  @singleton
  FirebaseFirestore fire() => FirebaseFirestore.instance;
}
