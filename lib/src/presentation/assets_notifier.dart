import 'package:equatable/equatable.dart';
import 'package:flutter_assets_explorer/src/presentation/helpers/assets_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/entities.dart';
import '../domain/helpers/helpers.dart';
import '../domain/services/services.dart';


class AssetsNotifier extends StateNotifier<AssetsState> {
  final AssetsService service;

  AssetsNotifier({
    required this.service
  }) : super(InitialAssetsState());

  List<AssetEntity> assets = [];

  void loadAssetsOnFolder() async {
    try {
      assets = await service.get();
      state = LoadingAssetsState();
      await Future.delayed(const Duration(seconds: 1));
      state = AssetsLoadedState(assets);
    } on DomainError catch (e) {
      state = AssetsLoadedState(assets);
    } catch (_) {
      state = AssetsErrorState();
    }
  }

  void filter(String text) {
    final filteredAssets = [...assets];
    filteredAssets.retainWhere((e) => e.path
      .toLowerCase()
      .contains(text.toLowerCase())
    );
    state = AssetsLoadedState(filteredAssets);
  }
}