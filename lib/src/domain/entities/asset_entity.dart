import 'dart:io';

import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String path;
  final File fileData;

  const AssetEntity({
    required this.path,
    required this.fileData
  });

  @override
  List<Object?> get props => [path, fileData];

}