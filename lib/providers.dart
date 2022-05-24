import 'package:flutter_assets_explorer/src/data/data.dart';
import 'package:flutter_assets_explorer/src/domain/entities/asset_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/presentation.dart';

final assetsNotifierProvider = StateNotifierProvider<AssetsNotifier, List<AssetEntity>>((ref) {
  return AssetsNotifier(
    service: const FilePickerAssetsService()
  );
});