part of 'update_create_business_view.dart';

class UpdateBusinessPage extends StatefulWidget {
  const UpdateBusinessPage({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.phoneController,
    required this.emailController,
    required this.webisteController,
    required this.instagramController,
    required this.telegramController,
    required this.servicesController,
    required this.viewModel,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController webisteController;
  final TextEditingController instagramController;
  final TextEditingController telegramController;
  final TextEditingController servicesController;
  final UpdateCreateBusinessViewModel viewModel;

  @override
  State<UpdateBusinessPage> createState() => UpdateBusinessPageWidgetState();
}

class UpdateBusinessPageWidgetState extends State<UpdateBusinessPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    )..addListener(() {
        widget.viewModel.onTabChanged(tabController.index);
      });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.viewModel.selectedTabIndex != 0
          ? SafeArea(
              child: Padding(
                padding: appSymmetricEdgePadding,
                child: AppButton(
                  busy: widget.viewModel.isBusy,
                  title: 'Save',
                  onTap: widget.viewModel.updateBusiness,
                ),
              ),
            )
          : null,
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
                  InkWell(
                    onTap: widget.viewModel.onSettingTap,
                    child: widget.viewModel.isDeletingBusiness
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
          controller: tabController,
          dividerColor: kcPrimaryColor,
          labelColor: kcPrimaryColor,
          indicatorColor: kcPrimaryColor,
          onTap: widget.viewModel.onTabChanged,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            _TabItem(
              title: 'Gallery',
              iconData: FontAwesomeIcons.image,
              isTabSelected: widget.viewModel.isTabSelected(0),
            ),
            _TabItem(
              title: 'Basic',
              iconData: FontAwesomeIcons.penToSquare,
              isTabSelected: widget.viewModel.isTabSelected(1),
            ),
            _TabItem(
              title: 'Address',
              iconData: FontAwesomeIcons.mapLocation,
              isTabSelected: widget.viewModel.isTabSelected(2),
            ),
            _TabItem(
              title: 'Comunication',
              iconData: FontAwesomeIcons.phone,
              isTabSelected: widget.viewModel.isTabSelected(3),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        const GalleryView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: BasicSection(
                categoryTitle: 'Business Category',
                nameController: widget.nameController,
                servicesController: widget.servicesController,
                descriptionController: widget.descriptionController),
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
              const AddressSection(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CommunicationSection(
            phoneController: widget.phoneController,
            emailController: widget.emailController,
            webisteController: widget.webisteController,
            instagramController: widget.instagramController,
            telegramController: widget.telegramController,
          ),
        ),
      ]),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem(
      {required this.isTabSelected,
      required this.title,
      required this.iconData});

  final bool isTabSelected;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Icon(
            iconData,
            size: 16,
            color: isTabSelected ? kcPrimaryColor : kcDark700,
          ),
          Text(
            title,
            style: ktsSmall(context).copyWith(
              fontSize: 11,
              color: isTabSelected ? kcPrimaryColor : kcDark700,
            ),
          ),
        ],
      ),
    );
  }
}
