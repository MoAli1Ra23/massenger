import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageSource {
  Future<String> uplodefile(File file, String col);
}

class FirebaseStorageSource extends StorageSource {
  final FirebaseStorage storage;

  FirebaseStorageSource({required this.storage});

  @override
  Future<String> uplodefile(File file, String col) async {
    try {
      return await storage
          .ref(col)
          .putFile(file)
          .then((x) => x.ref.fullPath)
          .onError((m, _) => throw FirebaseStorageError());
    } catch (e) {
      throw FirebaseStorageError();
    }
  }
}

class FirebaseStorageError extends Error {}
