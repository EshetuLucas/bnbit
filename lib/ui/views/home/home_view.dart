import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/views/account/account_view.dart';
import 'package:bnbit_app/ui/views/landing/landing_view.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.businessId});

  final String? businessId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => viewModel.initFCM(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          model.killAppConfirmation();
          return Future.value(false);
        },
        child: Scaffold(
            body: GetViewForIndex(
              index: model.currentIndex,
              businessId: businessId,
            ),
            bottomNavigationBar: BottomAppBar(
              color: Theme.of(context).colorScheme.tertiary,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: const CircularNotchedRectangle(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: BottomNavigationBarItem(
                            label: 'Home',
                            icon: homeSvg,
                            isSelected: model.currentIndex == 0,
                            context: context,
                            onTap: () {
                              model.onHomeIconTap();
                              model.setIndex(0);
                            },
                          ),
                        ),
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: BottomNavigationBarItem(
                              label: 'Explore',
                              icon: searchSvg,
                              isSelected: model.currentIndex == 1,
                              context: context,
                              onTap: () => model.setIndex(1),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: BottomNavigationBarItem(
                            label: 'Notifications',
                            icon: notificationSvg,
                            isSelected: model.currentIndex == 2,
                            context: context,
                            onTap: () => model.setIndex(2),
                            svgHight: 28,
                          ),
                        ),
                        FittedBox(
                          child: BottomNavigationBarItem(
                            label: 'Profile',
                            icon: profileSvg,
                            isSelected: model.currentIndex == 3,
                            context: context,
                            onTap: () => model.setIndex(3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class BottomNavigationBarItem extends StatelessWidget {
  const BottomNavigationBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.context,
      this.svgHight = 20,
      this.onTap})
      : super(key: key);
  final String label;
  final String icon;
  final bool isSelected;
  final BuildContext context;
  final VoidCallback? onTap;
  final double svgHight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Visibility(
              //   maintainSize: true,
              //   maintainAnimation: true,
              //   maintainState: true,
              //   visible: isSelected,
              //   child: AnimatedContainer(
              //     height: 3,
              //     width: screenWidth(context) / 10,
              //     curve: Curves.easeIn,
              //     duration: const Duration(milliseconds: 300),
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).colorScheme. primary,
              //       borderRadius: BorderRadius.circular(40),
              //     ),
              //   ),
              // ),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: SvgBuilder(
                  svg: icon,
                  height: svgHight,
                  color:
                      isSelected ? kcPrimaryColor : kcDark700.withOpacity(0.6),
                ),
              ),
              verticalSpace(2),
              Text(
                label,
                style: ktsWhiteMediumTextStyle(context).copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? kcPrimaryColor
                      : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GetViewForIndex extends StatelessWidget {
  const GetViewForIndex({Key? key, required this.index, this.businessId})
      : super(key: key);
  final int index;
  final String? businessId;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const LandingView();
      case 1:
        return const LandingView();
      case 2:
        return const LandingView();

      default:
        return const AccountView();
    }
  }
}
