import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/entities.dart';
import '../domain/services/services.dart';

class AssetsNotifier extends StateNotifier<List<AssetEntity>> {
  final AssetsService service;

  AssetsNotifier({
    required this.service
  }) : super([]);

  void loadFolder() async {
    state = await service.get();
  }
}