import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/services/business_service.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/services/services_view.form.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../widgets/svg_builder.dart';
import '../business_locations/business_locations_viewmodel.dart';
import 'services_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "price",
    ),
    FormTextField(
      name: "service",
    ),
  ],
)
class ServicesView extends StackedView<ServicesViewModel> with $ServicesView {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ServicesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: AppButton(
              enabled: viewModel.hasServices,
              title: 'Confirm',
              onTap: viewModel.onDone,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Services',
                hasPadding: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewModel.services.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return verticalSpace(10);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final service = viewModel.services[index];
                          return _ServiceWidget(
                            serviceModel: service,
                            onTap: () => viewModel.onAddService(index),
                            onRemove: () => viewModel.onRemove(index),
                          );

                          // _Service(
                          //   priceController: priceController,
                          //   serviceController: serviceController,
                          //   title: 'Service ${index + 1}',
                          //   index: index + 1,
                          //   onTap: () => viewModel.onAddService(index),
                          //   service: address,
                          //   onRemove: () => viewModel.onRemove(index),
                          // );
                        },
                      ),
                      verticalSpace(18),

                      _Service(
                        priceController: priceController,
                        serviceController: serviceController,
                        title: 'Add service',
                        index: viewModel.services.length + 1,
                        onTap: () => viewModel
                            .onAddService(viewModel.services.length + 1),
                        service: BusinessServiceModel(
                            service: 'Add service', price: 0),
                        //  onRemove: () => viewModel.onRemove(index),
                      ),
                      // _Location(
                      //   phoneNumberController: phoneNumberController,
                      //   lableController: lableController,
                      //   title: 'Add location ${viewModel.address.length + 1}',
                      //   index: viewModel.address.length + 1,
                      //   onTap: () =>
                      //       viewModel.onAddAddress(viewModel.address.length),
                      //   address: viewModel.placeHolderAddress,
                      // ),
                      verticalSpaceLarge,
                      verticalSpaceLarge,
                    ],
                  ),
                ),
              ),
              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10),
              //       child: InkWell(
              //         onTap: viewModel.onAddService,
              //         child: InputField(
              //           placeholder: 'Add Service one',

              //           maxLine: 1,
              //           // onChanged: viewModel.onChange,
              //           hasFocusedBorder: true,
              //           textInputType: TextInputType.name,

              //           // prefixIcon: const Padding(
              //           //   padding: EdgeInsets.all(15.0),
              //           //   child: SvgBuilder(svg: locationSvg),
              //           // ),
              //           suffixIcon: const Padding(
              //             padding: EdgeInsets.all(18.0),
              //             child: MoreIcon(),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ServicesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ServicesViewModel();
}

class _Service extends ViewModelWidget<ServicesViewModel> {
  const _Service({
    this.onTap,
    required this.index,
    required this.service,
    required this.title,
    required this.serviceController,
    required this.priceController,
    this.onRemove,
  });

  final int index;
  final BusinessServiceModel service;
  final VoidCallback? onTap;
  final String title;
  final VoidCallback? onRemove;
  final TextEditingController serviceController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context, ServicesViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: ktsSmallTitle(context),
            ),
            const Spacer(),
            if (onRemove != null)
              InkWell(
                onTap: onRemove,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: kcRed,
                ),
              )
          ],
        ),
        verticalSpaceSmall,
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: onTap,
                child: InputField(
                  placeholder: service.service,

                  maxLine: 1,
                  // onChanged: viewModel.onChange,
                  hasFocusedBorder: true,
                  textInputType: TextInputType.name,

                  prefixIcon: service.service != 'Add service'
                      ? Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgBuilder(
                            svg: serviceSvg,
                            height: 18,
                            width: 18,
                            color: kcDark700,
                          ),
                        )
                      : null,
                  suffixIcon: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: MoreIcon(),
                  ),
                ),
              ),
            ),
            // if (service.service != 'Add service') ...[
            //   verticalSpaceSmall,
            //   verticalSpaceTiny,
            //   InkWell(
            //     // onTap: () =>
            //     //     viewModel.onAddOtherDetails('Phone Number', index - 1),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 10),
            //       child: InputField(
            //         // controller: priceController,
            //         placeholder: 'Price',
            //         maxLine: 1,
            //         // onChanged: viewModel.onChange,
            //         hasFocusedBorder: true,
            //         textInputType: TextInputType.number,
            //       ),
            //     ),
            //   ),
            //   verticalSpaceSmall,
            //   verticalSpaceTiny,
            // ],
          ],
        ),
      ],
    );
  }
}

class _ServiceWidget extends StatelessWidget {
  _ServiceWidget({
    Key? key,
    required this.serviceModel,
    this.onTap,
    this.onRemove,
  }) : super(key: key);
  final BusinessServiceModel serviceModel;

  final TextEditingController controller = TextEditingController();

  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceTiny,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    serviceModel.service,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                horizontalSpaceSmall,
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    serviceModel.price.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                horizontalSpaceTiny,
                SizedBox(
                  height: 30,
                  width: 20,
                  child: InkWell(
                      onTap: onRemove,
                      child: const SvgBuilder(
                        svg: closeRedCircleSvg,
                        height: 17,
                      )),
                ),
                horizontalSpaceTiny,
              ],
            ),
            // Divider(
            //   color: kcDark700Light.withOpacity(0.3),
            // ),
            // verticalSpaceTiny,
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(4.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Price',
            //             style: ktsSmall(context).copyWith(
            //               fontSize: 13,
            //             ),
            //           ),
            //           Text(
            //             serviceModel.price.toString(),
            //             style: ktsSmall(context).copyWith(
            //               fontSize: 11,
            //               color: kcDarkGrey.withOpacity(0.6),
            //             ),
            //           ),
            //         ],
            //       ),
            //       // InputField(
            //       //   //   controller: controller,
            //       //   placeholder: address.phone_number ?? '',
            //       //   labelText: 'Phone Number *',
            //       //   maxLine: 1,
            //       //   // onChanged: viewModel.onChange,
            //       //   hasFocusedBorder: true,
            //       //   textInputType: TextInputType.phone,
            //       // ),
            //     ),
            //     horizontalSpaceSmall,
            //   ],
            // ),

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
