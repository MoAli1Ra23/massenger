// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageFile extends Equatable {
  final String? url;
  final String path;
  final String folder;

  const ImageFile({
    this.url,
    required this.path,
    required this.folder,
  });

  ImageFile copyWith({
    String? url,
    String? path,
    String? folder,
  }) {
    return ImageFile(
      url: url ?? this.url,
      path: path ?? this.path,
      folder: folder ?? this.folder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'path': path,
      'folder': folder,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, path, folder];

  factory ImageFile.fromMap(Map<String, dynamic> map) {
    return ImageFile(
      url: map['url'] != null ? map['url'] as String : null,
      path: map['path'] as String,
      folder: map['folder'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFile.fromJson(String source) => ImageFile.fromMap(json.decode(source) as Map<String, dynamic>);
}
