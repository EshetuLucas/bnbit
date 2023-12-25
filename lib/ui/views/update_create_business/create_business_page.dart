part of 'update_create_business_view.dart';

class CreateBusinessPage extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const CreateBusinessPage({
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
  Widget build(BuildContext context, UpdateCreateBusinessViewModel viewModel) {
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
                      AddImageWidget(
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
                      BasicSection(
                          servicesController: servicesController,
                          categoryTitle: 'Business address & Categories',
                          nameController: nameController,
                          descriptionController: descriptionController),
                      verticalSpace(2),
                      const SectionItemTitle('Address'),
                      verticalSpaceTiny,
                      const AddressSection(),
                      verticalSpaceSmall,
                      OperatingHours(
                        servicesController: servicesController,
                      ),
                      const Divider(),
                      verticalSpaceSmall,
                      CommunicationSection(
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
