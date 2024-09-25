import 'dart:io';

 
abstract class StorageSource {
  Future<String> uplodefile(File file, String col);
}
