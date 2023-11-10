import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:bnbit_app/ui/widgets/profile_pic_builder.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/shared_styles.dart';
import 'account_viewmodel.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      viewModelBuilder: () => AccountViewModel(),
      // ignore: deprecated_member_use
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpaceTiny,
                const _UserProfile(),
                const Divider(),
                verticalSpaceMedium,
                const _Actions(),
                verticalSpaceMedium,
                const Divider(),
                verticalSpaceMedium,
                ActionsItem(
                  title: 'Sign out',
                  svg: logOutSvg,
                  onTap: () => model.onLogout(),
                  backgroundColor: kcRed.withOpacity(0.2),
                  hasTail: false,
                )
                // AppButton(
                //   title: 'Logout',
                //   onTap: model.onLogout,
                // ),
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: _Actions(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Actions extends ViewModelWidget<AccountViewModel> {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.accountOptions.length,
        separatorBuilder: (BuildContext context, int index) {
          return verticalSpaceMedium;
        },
        itemBuilder: (BuildContext context, int index) {
          String title = model.accountOptions[index];
          return ActionsItem(
            title: title,
            svg: svgsPath + '/$title' + '.svg',
            svgSize: index == 3 ? 17 : 19,
            onTap: () => model.onOptionTap(index),
          );
        });
  }
}

class ActionsItem extends StatelessWidget {
  const ActionsItem({
    Key? key,
    required this.title,
    required this.svg,
    this.onTap,
    this.svgSize,
    this.backgroundColor,
    this.hasTail = true,
  }) : super(key: key);

  final String title;
  final String svg;
  final VoidCallback? onTap;
  final double? svgSize;
  final Color? backgroundColor;
  final bool hasTail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: backgroundColor ?? kcDark700Light.withOpacity(0.08),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: SvgBuilder(
                  svg: svg,
                  height: svgSize,
                ),
              ),
            ),
            horizontalSpaceSmall,
            horizontalSpaceTiny,
            Padding(
              padding: const EdgeInsets.only(bottom: 2.5),
              child: Text(
                title,
                style: ktsSmall(context),
              ),
            ),
            const Spacer(),
            if (hasTail) const MoreIcon(quarterTurns: 2)
          ],
        ),
      ],
    );
  }
}

class _UserProfile extends ViewModelWidget<AccountViewModel> {
  const _UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _ProfilePic(),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.userFullName,
                style: ktsSmall(context).copyWith(fontSize: 13.5),
              ),

              Text(
                model.phoneOrEmail,
                style: ktsSmall(context).copyWith(fontSize: 12),
              ),

              verticalSpaceSmall,

              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    horizontalSpaceMedium,
                    horizontalSpaceMedium,
                    Flexible(
                      child: AppButton(
                          backgroundColor: kcDark700.withOpacity(0.12),
                          borderRadius: 6,
                          title: 'Edit profile',
                          enablebuttonTextStyle: ktsSmall(context)
                              .copyWith(fontWeight: FontWeight.w600),
                          textColor: kcDark700Light,
                          fontSize: 12,
                          onTap: model.onEditProifle),
                    ),
                    horizontalSpaceSmall,
                    Flexible(
                      child: AppButton(
                          enablebuttonTextStyle: ktsSmall(context)
                              .copyWith(fontWeight: FontWeight.w600),
                          textColor: kcDark700Light,
                          fontSize: 12,
                          backgroundColor: kcDark700.withOpacity(0.12),
                          borderRadius: 6,
                          title: 'Create buisness',
                          onTap: model.onAddYourBusiness),
                    ),
                    horizontalSpaceMedium,
                    horizontalSpaceSmall,
                  ],
                ),
              )
              // GestureDetector(
              //   onTap: model.onPersonalInfoTap,
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.edit,
              //         color: kcPrimaryColor,
              //       ),
              //       horizontalSpaceSmall,
              //       Text(
              //         'Edit',
              //         style: ktsWhiteSmallTextStyle.copyWith(
              //           color: kcPrimaryColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProfilePic extends ViewModelWidget<AccountViewModel> {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return ProfilePicBuilder(
      backgroundColor: kcPrimaryColor.withOpacity(0.14),
      url: model.profilePic,
      size: 70,
      textStyle: ktsDarkSmall(context).copyWith(
        fontSize: 24,
        color: kcPrimaryColor,
      ),
    );
  }
}
