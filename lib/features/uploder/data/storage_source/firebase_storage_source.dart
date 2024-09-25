import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/features/uploder/data/storage_source/storage_source.dart';

import '../../../../core/error/firebase_storage_error.dart';
@LazySingleton(as: StorageSource,env: [Environment.dev,Environment.prod])
class FirebaseStorageSource extends StorageSource {
  final FirebaseStorage storage;

    FirebaseStorageSource({required this.storage});

  @override
  Future<String> uplodefile(File file, String col) async {
    try {
      return await storage
          .ref(col)
          .putFile(file)
          .then((x) => x.ref.getDownloadURL())
          .onError((m, _) => throw FirebaseStorageError());
    } catch (e) {
      throw FirebaseStorageError();
    }
  }
}
