import 'package:equatable/equatable.dart';
import 'package:flutter_assets_explorer/src/domain/entities/asset_entity.dart';

abstract class AssetsState extends Equatable {}

class InitialAssetsState extends AssetsState {
  @override
  List<Object?> get props => [];
}

class LoadingAssetsState extends AssetsState {
  @override
  List<Object?> get props => [];
}

class AssetsErrorState extends AssetsState {
  @override
  List<Object?> get props => [];
}

class AssetsLoadedState extends AssetsState {
  final List<AssetEntity> assets;

  AssetsLoadedState(this.assets) : super();

  @override
  List<Object?> get props => [];
}