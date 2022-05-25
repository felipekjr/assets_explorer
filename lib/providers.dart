import 'package:flutter_assets_explorer/src/data/data.dart';
import 'package:flutter_assets_explorer/src/presentation/helpers/assets_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/presentation.dart';

final assetsNotifierProvider = StateNotifierProvider<AssetsNotifier, AssetsState>((ref) {
  return AssetsNotifier(
    service: const FilePickerAssetsService()
  );
});