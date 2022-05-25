
import 'package:flutter/material.dart';
import 'package:flutter_assets_explorer/providers.dart';
import 'package:flutter_assets_explorer/src/presentation/helpers/assets_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entities/entities.dart';
import '../../theme/theme.dart';
import '../../widgets/widgets.dart';
import '../base_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  void _showErrorMessage() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assetsNotifierProvider);
    if (state is AssetsErrorState) {
      _showErrorMessage();
    }
    return BasePage(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topRow(ref),
          const SizedBox(height: Spacing.x5),
          if (state is InitialAssetsState)
            initialMessage()
          else if (state is LoadingAssetsState)
            loading()
          else if (state is AssetsLoadedState) ...[
            Text('Total: ${state.assets.length}', style: TextStyles.normal(),),
            const SizedBox(height: Spacing.x2),
            cards(state.assets)
          ]
        ],
      ),
    );
  }

  Padding loading() => const Padding(
    padding: EdgeInsets.only(top: Spacing.x10),
    child: PrimaryLoading(),
  );

  Center initialMessage() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: Spacing.x10,),
        SvgPicture.asset(
          'assets/images/search_assets_picture.svg',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: Spacing.x5,),
        Text(
          'Import a folder to see its assets',
          style: TextStyles.header(),
        ),
      ],
    ),
  );

  Widget topRow(WidgetRef ref) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      title(),
      Row(
        children: [
          button(ref),
          const SizedBox(width: Spacing.x2),
          search(ref),
        ],
      )
    ]
  );

  Widget title() => Text('Home', style: TextStyles.header());

  Widget button(WidgetRef ref) {
    return HoveredAnimatedButton(
      onClick: () => ref.read(assetsNotifierProvider.notifier).loadAssetsOnFolder()
    );
  }

  Widget search(WidgetRef ref) => SizedBox(
    width: 300,
    child: SearchInput(
      onChanged: (String v) {
        ref.read(assetsNotifierProvider.notifier).filter(v);
      },
    )
  );

  Widget cards(List<AssetEntity> assets) =>  GridView.builder(
    itemCount: assets.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: Spacing.x2,
      mainAxisSpacing: Spacing.x4,
    ),
    itemBuilder: (context, index) => card(assets[index]), 
  );


  Widget card(AssetEntity asset) => CustomCard(
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
                ) : SvgPicture.file(asset.file)
              ),
            )
          ]
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                SelectableText(
                  asset.name,
                  style: TextStyles.small().merge(const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),),
                ),
                // Flexible(
                //   child: IconButton(
                //     onPressed: () {}, 
                //     padding: const EdgeInsets.all(0),
                //     icon: Icon(
                //       Icons.copy, 
                //       size: 16,
                //       color: AppColor.primary
                //     )
                //   ),
                // )
              ],
            ),
          )
        ),
        const SizedBox(height: Spacing.x2),
      ]
    )
  );
}

