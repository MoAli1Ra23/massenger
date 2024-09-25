// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/uploder/domain/entity/image_file.dart';
import 'package:massenger/features/uploder/domain/repo/image_file_repo.dart';
import 'package:massenger/injection.dart';

class ImageUploderProvider extends StateNotifier<UplodeImageState> {
  ImageUploderProvider()
      : super(const UplodeImageState(
            file: null, failure: null, isUplaoding: false));
  Future<void> upload(File f, String folder) async {
    state = state.copyWith(isUplaoding: true);
    var x = await getIt
        .get<ImageFileRepo>()
        .uplodeImage(ImageFile(path: f.path, folder: folder));
    x.fold(
      (f) => state = state.copyWith(failure: f, isUplaoding: false),
      (r) => state = state.copyWith(file: r, isUplaoding: false),
    );
  }
}

class UplodeImageState extends Equatable {
  final ImageFile? file;
  final Failure? failure;
  final bool isUplaoding;

  const UplodeImageState(
      {required this.file, required this.failure, required this.isUplaoding});

  @override
  List<Object?> get props => [file, failure, isUplaoding];

  UplodeImageState copyWith({
    ImageFile? file,
    Failure? failure,
    bool? isUplaoding,
  }) {
    return UplodeImageState(
      file: file ?? this.file,
      failure: failure ?? this.failure,
      isUplaoding: isUplaoding ?? this.isUplaoding,
    );
  }
}
