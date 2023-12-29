import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'see_all_services_viewmodel.dart';

class SeeAllServicesView extends StackedView<SeeAllServicesViewModel> {
  const SeeAllServicesView({
    Key? key,
    required this.businessServices,
  }) : super(key: key);

  final List<BusinessServiceModel> businessServices;

  @override
  Widget builder(
    BuildContext context,
    SeeAllServicesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'All Services'),
            verticalSpaceTiny,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 5,
                runSpacing: 10,
                children: [
                  ...businessServices
                      .getRange(0, 5)
                      .map(
                        (service) => Wrap(
                          spacing: 4,
                          runSpacing: 6,
                          children: [
                            DecoratedContainer(
                              withCard: false,
                              elevation: 0.5,
                              // onTap: viewModel.onAddAddress,
                              borderRadius: 30,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      service.service,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: ktsSmall(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      service.price.toString() +
                                          ' ${service.currency ?? 'ETB'}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: ktsSmall(context),
                                    ),
                                  ),
                                  horizontalSpaceTiny,
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SeeAllServicesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SeeAllServicesViewModel();
}
