import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assets_explorer/src/domain/entities/asset_entity.dart';

import '../../core/utils/utils.dart';
import '../../domain/services/services.dart';

class FilePickerAssetsService implements AssetsService {
  const FilePickerAssetsService();
  
  @override
  Future<List<AssetEntity>> get() async {
    const validFiles = ['svg', 'png'];

    return FilePicker.platform.getDirectoryPath().then((String? selectedDirectory) async {
      if (selectedDirectory != null) {
        final dir = Directory(selectedDirectory);
        final List<FileSystemEntity> entities = await dir
          .list(recursive: true)
          .toList();
        final files = entities
          .whereType<File>()
          .where((e) => validFiles.contains(StringUtils.getExtension(e.path)))
          .toList();

        return files.map((File f) => _toAssetEntity(f)).toList();
      }
      return [];
    });
  }

  AssetEntity _toAssetEntity(File f) {
    return AssetEntity(
      name: StringUtils.getLastSlices(f.path, '/', 1),
      path: StringUtils.getLastSlices(f.path, '/', 6), 
      file: f,
      type: StringUtils.getExtension(f.path) == 'svg' 
        ? AssetType.svg 
        : AssetType.image
    );
  }
}