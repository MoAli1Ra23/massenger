import 'package:equatable/equatable.dart';

class ImageFile extends Equatable {
  final String? url;
  final String path;
  final String collectoin;

  const ImageFile({
    this.url,
    required this.path,
    required this.collectoin,
  });

  ImageFile copyWith({
    String? url,
    String? path,
    String? collectoin,
  }) {
    return ImageFile(
      url: url ?? this.url,
      path: path ?? this.path,
      collectoin: collectoin ?? this.collectoin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'path': path,
      'collectoin': collectoin,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url, path, collectoin];
}
