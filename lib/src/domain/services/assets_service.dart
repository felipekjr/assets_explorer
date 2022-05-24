import 'package:flutter_assets_explorer/src/domain/entities/asset_entity.dart';

abstract class AssetsService {
  Future<List<AssetEntity>> get();
}

