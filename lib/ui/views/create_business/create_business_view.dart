import 'dart:io';

import 'package:bnbit_app/api/common/api_consts.dart';
import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/gallery/gallery_view.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/image_builder.dart';
import 'package:bnbit_app/ui/widgets/image_place_holder.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:bnbit_app/ui/widgets/placeholder_image.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'create_business_view.form.dart';
import 'create_business_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "name",
    ),
    FormTextField(
      name: "description",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "webiste",
    ),
    FormTextField(
      name: "instagram",
    ),
    FormTextField(
      name: "telegram",
    ),
    FormTextField(
      name: "phone",
    ),
    FormTextField(
      name: "services",
    ),
  ],
)
class CreateBusinessView extends StackedView<CreateBusinessViewModel>
    with $CreateBusinessView {
  const CreateBusinessView({
    Key? key,
  }) : super(key: key);

  @override
  void onViewModelReady(CreateBusinessViewModel viewModel) {
    if (viewModel.selectedBusiness != null) {
      viewModel.onInit(viewModel.selectedBusiness!);
      nameController.text = viewModel.selectedBusiness!.name;
      descriptionController.text = viewModel.selectedBusiness!.description;
      phoneController.text = viewModel.selectedBusiness!.phone ?? '';
      emailController.text = viewModel.selectedBusiness!.email ?? '';
      webisteController.text = viewModel.selectedBusiness!.website ?? '';
      instagramController.text = viewModel.selectedBusiness!.instagram ?? '';
      telegramController.text = viewModel.selectedBusiness!.telegram ?? '';
      servicesController.text = viewModel.selectedBusiness!.services.isEmpty
          ? ''
          : viewModel.selectedBusiness!.services.first;
    }
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CreateBusinessViewModel viewModel) {
    disposeForm();
    viewModel.clearNewBusiness();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    CreateBusinessViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: viewModel.isBusy || viewModel.isDeletingBusiness,
          child: viewModel.selectedBusiness != null
              ? _UpdateBusinessWidget(
                  nameController: nameController,
                  descriptionController: descriptionController,
                  phoneController: phoneController,
                  emailController: emailController,
                  webisteController: webisteController,
                  instagramController: instagramController,
                  telegramController: telegramController,
                  servicesController: servicesController,
                )
              : CreateBusinessWidget(
                  nameController: nameController,
                  descriptionController: descriptionController,
                  phoneController: phoneController,
                  emailController: emailController,
                  webisteController: webisteController,
                  instagramController: instagramController,
                  telegramController: telegramController,
                  servicesController: servicesController,
                ),
        ),
        if (viewModel.isBusy)
          Container(
            color: kcDark700.withOpacity(0.3),
            child: const Center(
              child: Material(
                color: kcTransparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Spinner(),
                    ),
                    verticalSpaceSmall,
                    verticalSpaceSmall,
                    Text('Please wait'),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }

  @override
  CreateBusinessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateBusinessViewModel();
}

class _UpdateBusinessWidget extends ViewModelWidget<CreateBusinessViewModel> {
  const _UpdateBusinessWidget({
    required this.nameController,
    required this.descriptionController,
    required this.phoneController,
    required this.emailController,
    required this.webisteController,
    required this.instagramController,
    required this.telegramController,
    required this.servicesController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController webisteController;
  final TextEditingController instagramController;
  final TextEditingController telegramController;
  final TextEditingController servicesController;

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // bottomNavigationBar: viewModel.selectedTabIndex != 0
        //   ?

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: AppButton(
              busy: viewModel.isBusy,
              title: 'Save',
              onTap: viewModel.updateBusiness,
            ),
          ),
        ),
        //  : null,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kcWhite,
          elevation: 0,
          title: CustomAppBar(
            title: 'Business Profile',
            tail: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Row(
                  children: [
                    // InkWell(
                    //   onTap: viewModel.onQrCodeTap,
                    //   child: Icon(
                    //     Icons.qr_code,
                    //     color: kcDark700Light,
                    //     size: 20,
                    //   ),
                    // ),
                    // horizontalSpaceTiny,
                    // horizontalSpaceTiny,
                    InkWell(
                      onTap: viewModel.onSettingTap,
                      child: viewModel.isDeletingBusiness
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: Spinner(
                                size: 12,
                                color: kcRed,
                              ),
                            )
                          : const SvgBuilder(
                              svg: settingSvg,
                            ),
                    ),
                  ],
                )),
            hasPadding: false,
          ),
          bottom: TabBar(
            dividerColor: kcPrimaryColor,
            labelColor: kcPrimaryColor,
            indicatorColor: kcPrimaryColor,
            onTap: viewModel.onTabChanged,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            tabs: [
              FittedBox(
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.image,
                      size: 16,
                      color: viewModel.isTabSelected(0)
                          ? kcPrimaryColor
                          : kcDark700,
                    ),
                    Text(
                      'Gallery',
                      style: ktsSmall(context).copyWith(
                        fontSize: 11,
                        color: viewModel.isTabSelected(0)
                            ? kcPrimaryColor
                            : kcDark700,
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.edit,
                      size: 16,
                      color: viewModel.isTabSelected(1)
                          ? kcPrimaryColor
                          : kcDark700,
                    ),
                    Text(
                      'Basic',
                      style: ktsSmall(context).copyWith(
                        fontSize: 11,
                        color: viewModel.isTabSelected(1)
                            ? kcPrimaryColor
                            : kcDark700,
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.mapLocation,
                      size: 16,
                      color: viewModel.isTabSelected(2)
                          ? kcPrimaryColor
                          : kcDark700,
                    ),
                    Text(
                      'Address',
                      style: ktsSmall(context).copyWith(
                        fontSize: 11,
                        color: viewModel.isTabSelected(2)
                            ? kcPrimaryColor
                            : kcDark700,
                      ),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.phone,
                      size: 16,
                      color: viewModel.isTabSelected(3)
                          ? kcPrimaryColor
                          : kcDark700,
                    ),
                    Text(
                      'Comunication',
                      style: ktsSmall(context).copyWith(
                        fontSize: 11,
                        color: viewModel.isTabSelected(3)
                            ? kcPrimaryColor
                            : kcDark700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          const GalleryView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: _BasicSection(
                  categoryTitle: 'Business Category',
                  nameController: nameController,
                  servicesController: servicesController,
                  descriptionController: descriptionController),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Address',
                  style: ktsSmall(context).copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kcPrimaryColor),
                ),
                verticalSpaceSmall,
                const _AddressSection(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: _Communication(
              phoneController: phoneController,
              emailController: emailController,
              webisteController: webisteController,
              instagramController: instagramController,
              telegramController: telegramController,
            ),
          ),
        ]),
      ),
    );
  }
}

class CreateBusinessWidget extends ViewModelWidget<CreateBusinessViewModel> {
  const CreateBusinessWidget({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.phoneController,
    required this.emailController,
    required this.webisteController,
    required this.instagramController,
    required this.telegramController,
    required this.servicesController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController webisteController;
  final TextEditingController instagramController;
  final TextEditingController telegramController;
  final TextEditingController servicesController;

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: AppButton(
            busy: viewModel.isBusy,
            title: viewModel.hasBusiness ? 'Save' : 'Create Business',
            onTap: viewModel.onCreateBusiness,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: viewModel.hasBusiness
                  ? 'Business Setting'
                  : 'Create Business',
              tail: viewModel.hasBusiness
                  ? InkWell(
                      onTap: viewModel.onDelete,
                      child: viewModel.isDeletingBusiness
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: Spinner(
                                size: 12,
                                color: kcRed,
                              ),
                            )
                          : const SvgBuilder(
                              svg: trashSvg,
                              color: kcRed,
                              height: 18,
                            ),
                    )
                  : null,
            ),
            verticalSpaceSmall,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: appSymmetricEdgePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceTiny,
                      _AddImageWidget(
                          hasBusiness: viewModel.hasBusiness,
                          images: viewModel.selectedBusiness == null
                              ? []
                              : viewModel.selectedBusiness!.images
                                  .map((e) => e.image)
                                  .toList()),
                      verticalSpaceTiny,
                      verticalSpaceTiny,
                      const Divider(),
                      verticalSpaceTiny,
                      _BasicSection(
                          servicesController: servicesController,
                          categoryTitle: 'Business address & Categories',
                          nameController: nameController,
                          descriptionController: descriptionController),
                      verticalSpace(2),
                      Text(
                        'Address',
                        style: ktsSmall(context).copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: kcDark.withOpacity(0.8),
                        ),
                      ),
                      verticalSpaceTiny,
                      const _AddressSection(),
                      verticalSpaceSmall,
                      _OperatingHoursWidget(
                        servicesController: servicesController,
                      ),
                      const Divider(),
                      verticalSpaceSmall,
                      _Communication(
                        phoneController: phoneController,
                        emailController: emailController,
                        webisteController: webisteController,
                        instagramController: instagramController,
                        telegramController: telegramController,
                      ),
                      verticalSpaceLarge,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OperatingHoursWidget extends ViewModelWidget<CreateBusinessViewModel> {
  const _OperatingHoursWidget({
    required this.servicesController,
  });

  final TextEditingController servicesController;

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Operating hours',
        style: ktsSmall(context).copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: kcDark.withOpacity(0.8),
        ),
      ),
      verticalSpaceTiny,
      if (!viewModel.hasSelectedTradinghours)
        InkWell(
          onTap: viewModel.onOperatingHoursTap,
          child: InputField(
            hintTextStyle: ktsSmall(context),
            placeholder: 'Operating hours',

            maxLine: 1,
            // onChanged: viewModel.onChange,
            hasFocusedBorder: true,
            textInputType: TextInputType.name,
            isReadOnly: viewModel.isBusy,

            suffixIcon: const Padding(
              padding: EdgeInsets.all(18.0),
              child: MoreIcon(),
            ),
          ),
        )
      else
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: viewModel.selectedTradingHours.entries
                .map(
                  (tradingHourEntry) => Column(
                    children: [
                      verticalSpaceSmall,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tradingHourEntry.key,
                            style: ktsSmall(context).copyWith(
                              fontSize: 12,
                              color: kcDarkGrey,
                            ),
                          ),
                          Text(
                            '${tradingHourEntry.value!.startTime.format(context)} - ${tradingHourEntry.value!.endTime.format(context)}',
                            style: ktsSmall(context).copyWith(
                              fontSize: 12,
                              color: kcDarkGrey,
                            ),
                          )
                        ],
                      ),
                      verticalSpaceSmall,
                      const Divider(),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      if (viewModel.hasSelectedTradinghours)
        InkWell(
          onTap: viewModel.onOperatingHoursTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit',
                style: ktsSmall(context)
                    .copyWith(color: kcPrimaryColor, fontSize: 14),
              ),
              horizontalSpaceSmall,
              const SvgBuilder(
                svg: editSvg,
                color: kcPrimaryColor,
              ),
            ],
          ),
        ),
      if (viewModel.selectedBusiness != null) ...[
        verticalSpaceSmall,
        Text(
          'Services',
          style: ktsSmall(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: kcDark.withOpacity(0.8),
          ),
        ),
        verticalSpaceTiny,
        InputField(
          contentPadding: const EdgeInsets.only(
            left: 16,
            top: 23,
            bottom: 0,
            right: 10,
          ),
          fieldHeight: 140,
          placeholder: 'Service one, Service two, ....',
          maxLine: 8,
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: servicesController,
        ),
      ]
    ]);
  }
}

class _AddressSection extends ViewModelWidget<CreateBusinessViewModel> {
  const _AddressSection();

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (viewModel.selectedAddress.isEmpty)
          InkWell(
            onTap: viewModel.onAddAddress,
            child: InputField(
              hintTextStyle: ktsSmall(context),
              placeholder: 'Select Address',

              maxLine: 1,
              // onChanged: viewModel.onChange,
              hasFocusedBorder: true,
              textInputType: TextInputType.name,
              isReadOnly: viewModel.isBusy,

              suffixIcon: const Padding(
                padding: EdgeInsets.all(18.0),
                child: MoreIcon(),
              ),
            ),
          )
        else
          Column(
            children: [
              ...viewModel.selectedAddress
                  .map(
                    (address) => ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // spacing: 2,
                      // runSpacing: 6,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 6),
                          child: DecoratedContainer(
                              onTap: () => viewModel.onAddressTap(address),
                              borderRadius: 10,
                              child: _AddressWidget(address: address)

                              // Row(
                              //   children: [
                              //     Flexible(
                              //       child: Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 10, vertical: 10),
                              //         child: Text(
                              //           address.displayAddress,
                              //           maxLines: 1,
                              //           overflow: TextOverflow.ellipsis,
                              //           style: ktsSmall(context),
                              //         ),
                              //       ),
                              //     ),
                              //     InkWell(
                              //       onTap: () => viewModel.onAddressTap(address),
                              //       child: Icon(
                              //         Icons.more_vert,
                              //         color: kcDark700,
                              //       ),
                              //     ),
                              //     horizontalSpaceTiny,
                              //     horizontalSpaceTiny,
                              //   ],
                              // ),
                              ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 4, 6, 0),
                child: SizedBox(
                  width: screenWidth(context),
                  child: DecoratedContainer(
                    onTap: viewModel.onAddAddress,
                    borderRadius: 10,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(' + Add'),
                    ),
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}

class _Communication extends ViewModelWidget<CreateBusinessViewModel> {
  const _Communication({
    required this.phoneController,
    required this.emailController,
    required this.webisteController,
    required this.instagramController,
    required this.telegramController,
  });

  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController webisteController;
  final TextEditingController instagramController;
  final TextEditingController telegramController;

  @override
  Widget build(
    BuildContext context,
    CreateBusinessViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ways for people to reach you',
          style: ktsSmall(context).copyWith(
              fontSize: 13, fontWeight: FontWeight.w600, color: kcPrimaryColor),
        ),
        verticalSpaceSmall,
        verticalSpaceSmall,
        InputField(
          placeholder: 'Phone Number ',
          labelText: 'Phone Number *',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('phone'),
          hasFocusedBorder: true,
          textInputType: TextInputType.phone,
          isReadOnly: viewModel.isBusy,
          controller: phoneController,
        ),
        if (viewModel.hasCommunicationFormatError('phone')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['phone']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'contact@examplebusiness.com',
          labelText: 'Email (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('email'),
          hasFocusedBorder: true,
          textInputType: TextInputType.emailAddress,
          isReadOnly: viewModel.isBusy,
          controller: emailController,
        ),
        if (viewModel.hasCommunicationFormatError('email')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['email']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://www.examplebusiness.com',
          labelText: 'Website (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('website'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: webisteController,
        ),
        if (viewModel.hasCommunicationFormatError('website')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['website']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://www.instagram.com/example_username/',
          labelText: 'Instagram (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('instagram'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: instagramController,
        ),
        if (viewModel.hasCommunicationFormatError('instagram')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['instagram']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://t.me/example_channel',
          labelText: 'Telegram (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('telegram'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: telegramController,
        ),
        if (viewModel.hasCommunicationFormatError('telegram')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['telegram']!),
          verticalSpaceSmall,
        ],
      ],
    );
  }
}

class _BasicSection extends ViewModelWidget<CreateBusinessViewModel> {
  const _BasicSection({
    required this.nameController,
    required this.descriptionController,
    required this.categoryTitle,
    required this.servicesController,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;

  final TextEditingController servicesController;

  final String categoryTitle;

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Business name & detail',
          style: ktsSmall(context).copyWith(
              fontSize: 13, fontWeight: FontWeight.w600, color: kcPrimaryColor),
        ),
        verticalSpaceSmall,
        Text(
          'Name',
          style: ktsSmall(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: kcDark.withOpacity(0.8),
          ),
        ),
        verticalSpaceTiny,
        InputField(
          placeholder: 'Name',

          maxLine: 1,
          // onChanged: viewModel.onChange,
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: nameController,
        ),
        if (!viewModel.hasNoValidName) verticalSpaceSmall,
        if (viewModel.hasNoValidName) ...[
          ValidationMessage(title: viewModel.nameValidationMessage),
          verticalSpaceSmall,
        ],
        Text(
          'Description',
          style: ktsSmall(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: kcDark.withOpacity(0.8),
          ),
        ),
        verticalSpaceTiny,
        InputField(
          placeholder: 'Description',

          maxLine: 1,
          // onChanged: viewModel.onChange,
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: descriptionController,
        ),
        if (!viewModel.hasNoValidDescription) verticalSpaceSmall,
        if (viewModel.hasNoValidDescription) ...[
          ValidationMessage(title: viewModel.descriptionValidationMessage),
          verticalSpaceSmall,
        ],
        const Divider(),
        verticalSpaceSmall,
        Text(
          categoryTitle,
          style: ktsSmall(context).copyWith(
              fontSize: 13, fontWeight: FontWeight.w600, color: kcPrimaryColor),
        ),
        verticalSpaceSmall,
        if (!viewModel.hasAdress && viewModel.showValidationIfAny) ...[
          const ValidationMessage(title: 'Please add business address'),
          verticalSpaceSmall,
        ],
        Text(
          'Category & Sub Category',
          style: ktsSmall(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: kcDark.withOpacity(0.8),
          ),
        ),
        verticalSpaceTiny,
        InkWell(
          onTap: viewModel.onSelectCategory,
          child: InputField(
            hintTextStyle: ktsSmall(context),
            placeholder: viewModel.selectedCategory?.name ?? 'Select Category',

            maxLine: 1,
            // onChanged: viewModel.onChange,
            hasFocusedBorder: true,
            textInputType: TextInputType.name,
            isReadOnly: viewModel.isBusy,

            suffixIcon: const Padding(
              padding: EdgeInsets.all(18.0),
              child: MoreIcon(),
            ),
          ),
        ),
        if (viewModel.selectedSubCategories.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 4,
              runSpacing: 6,
              children: viewModel.selectedSubCategories
                  .map(
                    (subCategory) => Wrap(
                      spacing: 4,
                      runSpacing: 6,
                      children: [
                        DecoratedContainer(
                          // onTap: viewModel.onAddAddress,
                          borderRadius: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Text(
                              subCategory.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ktsSmall(context),
                            ),
                          ),
                        ),
                        if (viewModel.isLastSubCategory(subCategory))
                          DecoratedContainer(
                            onTap: () =>
                                viewModel.onSelectSubCategory(isAdd: true),
                            borderRadius: 30,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Text(' + Add'),
                            ),
                          )
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        else
          verticalSpaceSmall,
        if (viewModel.selectedBusiness != null) ...[
          const Divider(),
          Text(
            'Operating hours',
            style: ktsSmall(context).copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: kcPrimaryColor),
          ),
          verticalSpaceSmall,
          _OperatingHoursWidget(
            servicesController: servicesController,
          )
        ]
      ],
    );
  }
}

class _AddImageWidget extends ViewModelWidget<CreateBusinessViewModel> {
  const _AddImageWidget({
    required this.hasBusiness,
    required this.images,
  });
  final bool hasBusiness;
  final List<String> images;

  @override
  Widget build(BuildContext context, CreateBusinessViewModel viewModel) {
    return hasBusiness
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Photo Gallery',
                    style: ktsSmall(context).copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kcPrimaryColor),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: viewModel.onEditGallery,
                    child: const SvgBuilder(
                      svg: editSvg,
                      color: kcPrimaryColor,
                    ),
                  )
                ],
              ),
              verticalSpaceSmall,
              SizedBox(
                height: 85,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: DecoratedContainer(
                        borderRadius: 8,
                        withCard: true,
                        child: PlaceholderImage(
                          placeHolder: const ImagePlaceHolder(),
                          roundedCorners: false,
                          fit: BoxFit.cover,
                          imageUrl: baseUrl + '/' + images[index],
                          errorImageUrl: placeHolderImage,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : SizedBox(
            height: 120,
            width: screenWidth(context),
            child: viewModel.selectedFile != null
                ? InkWell(
                    onTap: viewModel.onAddImage,
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: kcDark700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 1,
                      child: Image.file(
                        File(viewModel.selectedFile!.path),
                        fit: BoxFit.cover,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) =>
                                frame == null
                                    ? Container(
                                        alignment: Alignment.center,
                                        // color: Theme.of(context).colorScheme. primary,
                                        child: Shimmer.fromColors(
                                          baseColor: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.99),
                                          highlightColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          child: const ImageBuilder(
                                            height: 120,
                                            fit: BoxFit.cover,
                                            imagePath: iconImage,
                                          ),
                                          enabled: true,
                                        ),
                                      )
                                    : child,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: viewModel.onAddImage,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [6, 3],
                      radius: const Radius.circular(1),
                      strokeWidth: 0.3,
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add,
                            color: kcPrimaryColor,
                            size: 20,
                          ),
                          horizontalSpaceSmall,
                          Text(
                            'Add cover image',
                            style: ktsSmall(context)
                                .copyWith(color: kcPrimaryColor),
                          ),
                        ],
                      )),
                    ),
                  ),
          );
  }
}

class _AddressWidget extends StatelessWidget {
  _AddressWidget({
    Key? key,
    required this.address,
  }) : super(key: key);
  final Address address;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                address.displayAddress,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Divider(
              color: kcDark700Light.withOpacity(0.3),
            ),
            verticalSpaceTiny,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: ktsSmall(context).copyWith(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        address.phone_number ?? '',
                        style: ktsSmall(context).copyWith(
                          fontSize: 11,
                          color: kcDarkGrey.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  // InputField(
                  //   //   controller: controller,
                  //   placeholder: address.phone_number ?? '',
                  //   labelText: 'Phone Number *',
                  //   maxLine: 1,
                  //   // onChanged: viewModel.onChange,
                  //   hasFocusedBorder: true,
                  //   textInputType: TextInputType.phone,
                  // ),
                ),
                horizontalSpaceSmall,
                if (address.label != null)
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lable',
                            style: ktsSmall(context).copyWith(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            address.label ?? '_____',
                            style: ktsSmall(context).copyWith(
                              fontSize: 11,
                              color: kcDarkGrey.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                      // InputField(
                      //   //   controller: controller,
                      //   placeholder: address.phone_number ?? '',
                      //   labelText: 'Phone Number *',
                      //   maxLine: 1,
                      //   // onChanged: viewModel.onChange,
                      //   hasFocusedBorder: true,
                      //   textInputType: TextInputType.phone,
                      // ),
                    ),
                  ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InputField(
            //     placeholder: address.state ?? 'Lable',
            //     labelText: 'Lable',
            //     maxLine: 1,
            //     // onChanged: viewModel.onChange,
            //     hasFocusedBorder: true,
            //     textInputType: TextInputType.phone,
            //   ),
            // ),
            verticalSpaceTiny,
          ],
        ),
      ),
    );
  }
}
