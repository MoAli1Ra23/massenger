import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:massenger/features/uploder/presentation/provider/image_uploder_provider.dart';

var uploder =
    StateNotifierProvider.autoDispose<ImageUploderProvider, UplodeImageState>(
        (ref) => ImageUploderProvider());

class SelectUploadImage extends ConsumerWidget {
  const SelectUploadImage({
    super.key,
    required this.folder,
  });
  final String folder;
  @override
  Widget build(BuildContext context, ref) {
    var x = ref.watch(uploder);
    if (x.isUplaoding) return const CircularProgressIndicator();
    if (!x.isUplaoding && x.file != null) {
      return CachedNetworkImage(
        imageUrl: x.file!.url ?? x.file!.path,
      );
    }

    return IconButton(
      icon: const Icon(Icons.attach_file_sharp),
      onPressed: () async {
        var r = await ImagePicker().pickImage(
            maxHeight: 120, maxWidth: 120, source: ImageSource.gallery);
        if (r != null) {
          ref.read(uploder.notifier).upload(File(r.path), folder);
        }
      },
    );
  }
}
