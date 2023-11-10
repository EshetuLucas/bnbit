import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends StackedView<LandingViewModel> {
  const LandingView({Key? key}) : super(key: key);
  @override
  void onViewModelReady(LandingViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    LandingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpaceTiny,
            const _Header(),
            verticalSpaceMedium,
            const _SubCategories(),
            verticalSpaceTiny,
            const _Business(),
            verticalSpaceMedium,
            verticalSpaceTiny,
            const _Business()
          ],
        ),
      ),
    );
  }

  @override
  LandingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LandingViewModel();
}

class _Business extends StatelessWidget {
  const _Business();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: appSymmetricEdgePadding,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBuilder(
              imagePath: placeHolderImage,
              height: 145,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
            verticalSpaceSmall,
            Text(
              'Wow Coffee',
              style: ktsSemibold(context).copyWith(fontSize: 14),
            ),
            verticalSpaceTiny,
            Row(
              children: [
                const SvgBuilder(
                  svg: locationSvg,
                  height: 14,
                ),
                horizontalSpaceTiny,
                Text(
                  'Bole, Addis Ababa Ethiopia',
                  style: ktsDarkSmall(context).copyWith(fontSize: 11),
                ),
                const Spacer(),
                const Text('0.5km')
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SubCategories extends ViewModelWidget<LandingViewModel> {
  const _SubCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: appSymmetricEdgePadding,
        shrinkWrap: viewModel.isBusy,
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.subCategories.length,
        //viewModel.specialitites.length,
        separatorBuilder: (BuildContext context, int index) {
          return horizontalSpaceSmall;
        },
        itemBuilder: (BuildContext context, int index) {
          final subCategory = viewModel.subCategories[index];
          final isSelected = viewModel.isSelected(index);
          return InkWell(
            onTap: () => viewModel.onSubCategoryTap(index),
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                    child: SvgBuilder(
                      svg: subCategory.svg,
                      color: isSelected
                          ? kcPrimaryColor
                          : Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.6),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 100),
                      height: 20,
                      child: Text(
                        subCategory.name,

                        style: ktsWhiteSmallTextStyle(context).copyWith(
                          fontWeight:
                              isSelected ? FontWeight.w500 : FontWeight.w100,
                          fontSize: isSelected ? 13 : 12,
                          color: isSelected
                              ? kcPrimaryColor
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                        //overflow: TextOverflow.clip,
                        // maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends ViewModelWidget<LandingViewModel> {
  const _Header();

  @override
  Widget build(BuildContext context, LandingViewModel viewModel) {
    return Container(
      padding: appSymmetricEdgePadding,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: viewModel.onChangeCategory,
                child: Row(
                  children: [
                    Text(
                      viewModel.selectedCategory.name,
                      style: ktsBoldMeidumDarkTextStyle(context).copyWith(
                        color: kcPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                    horizontalSpaceTiny,
                    const Icon(
                      Icons.expand_more,
                      size: 28,
                      color: kcPrimaryColor,
                    )
                  ],
                ),
              ),
              Text(
                'Tap to change category',
                style: ktsSmall(context).copyWith(
                  fontSize: 11,
                  color: kcDark700Light,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Row(
                children: [
                  const SvgBuilder(svg: locationSvg),
                  horizontalSpaceTiny,
                  Text(
                    'Bole, Addis Ababa',
                    style: ktsSmall(context).copyWith(fontSize: 11.5),
                  ),
                  horizontalSpaceTiny,
                ],
              ),
              verticalSpaceTiny,
              Row(
                children: [
                  const Icon(
                    Icons.menu,
                    color: kcPrimaryColor,
                    size: 20,
                  ),
                  horizontalSpaceMedium,
                  Icon(
                    Icons.map,
                    color: kcDark700Light,
                    size: 20,
                  ),
                  horizontalSpaceTiny,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
