 import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
 
@module
abstract class MyFirebaseStorage {
  @lazySingleton
  FirebaseStorage storage()=>FirebaseStorage.instance;
}
