
import 'package:flutter/material.dart';
import 'package:flutter_assets_explorer/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/entities.dart';
import '../../theme/theme.dart';
import '../../widgets/widgets.dart';
import '../base_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsNotifierProvider);
    return BasePage(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topRow(ref),
          const SizedBox(height: Spacing.x10),
          cards(assets)
        ],
      ),
    );
  }

  Widget topRow(WidgetRef ref) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      title(),
      button(ref),
      search(),
    ]
  );

  Widget title() => Text('Geral', style: TextStyles.header());

  Widget button(WidgetRef ref) {
    return HoveredAnimatedButton(
      onClick: () => ref.read(assetsNotifierProvider.notifier).loadFolder()
    );
  }

  Widget search() => const SizedBox(
    width: 300,
    child: SearchInput()
  );

  Widget cards(List<AssetEntity> assets) =>  GridView.count(
    primary: false,
    crossAxisSpacing: Spacing.x2,
    mainAxisSpacing: Spacing.x4,
    crossAxisCount: 4,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: assets.map((AssetEntity asset) {
      return CustomCard(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/transparent-bg.png',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: asset.type == AssetType.image ? Image.file(
                      asset.file,
                      fit: BoxFit.contain,
                    ) : SvgPicture.file(
                      asset.file, 
                    )
                  ),
                )
              ]
            ),
            const SizedBox(height: Spacing.x2),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 10,
                      child: Text(
                        asset.name,
                        overflow: TextOverflow.clip,
                        style: TextStyles.small(),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {}, 
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                          Icons.copy, 
                          size: 16,
                          color: AppColor.primary
                        )
                      ),
                    )
                  ],
                ),
              )
            ),
            const SizedBox(height: Spacing.x2),
          ]
        )
      );
    }).toList()
  );
}
