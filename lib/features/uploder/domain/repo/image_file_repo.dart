import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/uploder/domain/entity/image_file.dart';

abstract class ImageFileRepo{
  Future<Either<Failure,ImageFile>> uplodeImage(ImageFile f) ;
}