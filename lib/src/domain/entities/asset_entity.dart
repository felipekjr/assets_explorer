import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum AssetType {
  image,
  svg
}
class AssetEntity extends Equatable {
  final String path;
  final String name;
  final File file;
  final AssetType type;

  const AssetEntity({
    required this.path,
    required this.name,
    required this.file,
    required this.type,
  });

  @override
  List<Object?> get props => [
    name,
    path, 
    type, 
    file
  ];

}