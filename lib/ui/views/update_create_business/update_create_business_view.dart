import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/gallery/gallery_view.dart';
import 'package:bnbit_app/ui/views/update_create_business/widgets/operating_hours.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'update_create_business_view.form.dart';
import 'update_create_business_viewmodel.dart';
import 'sections/address_section.dart';
import 'sections/basic_section.dart';
import 'widgets/add_image_widget.dart';
import 'widgets/communication.dart';
import 'widgets/section_item_title.dart';

part 'create_business_page.dart';
part 'update_business_page.dart';

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
class UpdateCreateBusinessView
    extends StackedView<UpdateCreateBusinessViewModel>
    with $UpdateCreateBusinessView {
  const UpdateCreateBusinessView({
    Key? key,
  }) : super(key: key);

  @override
  void onViewModelReady(UpdateCreateBusinessViewModel viewModel) {
    if (viewModel.selectedBusiness != null) {
      viewModel.onInit(viewModel.selectedBusiness!);
      nameController.text = viewModel.selectedBusiness!.name;
      descriptionController.text = viewModel.selectedBusiness!.description;
      phoneController.text = viewModel.selectedBusiness!.phone ?? '';
      emailController.text = viewModel.selectedBusiness!.email ?? '';
      webisteController.text = viewModel.selectedBusiness!.website ?? '';
      instagramController.text = viewModel.selectedBusiness!.instagram ?? '';
      telegramController.text = viewModel.selectedBusiness!.telegram ?? '';
    }
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(UpdateCreateBusinessViewModel viewModel) {
    disposeForm();
    viewModel.clearNewBusiness();
    super.onDispose(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UpdateCreateBusinessViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: viewModel.isBusy || viewModel.isDeletingBusiness,
          child: viewModel.selectedBusiness != null
              ? UpdateBusinessPage(
                  viewModel: viewModel,
                  nameController: nameController,
                  descriptionController: descriptionController,
                  phoneController: phoneController,
                  emailController: emailController,
                  webisteController: webisteController,
                  instagramController: instagramController,
                  telegramController: telegramController,
                  servicesController: servicesController,
                )
              : CreateBusinessPage(
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
  UpdateCreateBusinessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UpdateCreateBusinessViewModel();
}
