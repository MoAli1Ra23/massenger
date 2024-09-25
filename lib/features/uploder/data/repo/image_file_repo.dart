import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/uploder/data/storage_source/storage_source.dart';
import 'package:massenger/features/uploder/domain/entity/image_file.dart';
import 'package:massenger/features/uploder/domain/repo/image_file_repo.dart';

@LazySingleton(as: ImageFileRepo, env: [Environment.dev, Environment.prod])
class ImageFileRepoImp extends ImageFileRepo {
  final StorageSource source;

  ImageFileRepoImp(this.source);
  @override
  Future<Either<Failure, ImageFile>> uplodeImage(ImageFile f) async {
    try {
      return await source
          .uplodefile(File(f.path), f.folder)
          .then((s) => right(f.copyWith(url: s)));
    } catch (e) {
      return left(AuthFailure());
    }
  }
}
