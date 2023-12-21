import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/custom_app_bar.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/more_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'services_viewmodel.dart';

class ServicesView extends StackedView<ServicesViewModel> {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ServicesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: appSymmetricEdgePadding,
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Services',
                hasPadding: false,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      // onTap: onTap,
                      child: InputField(
                        placeholder: 'Add Service one',

                        maxLine: 1,
                        // onChanged: viewModel.onChange,
                        hasFocusedBorder: true,
                        textInputType: TextInputType.name,

                        // prefixIcon: const Padding(
                        //   padding: EdgeInsets.all(15.0),
                        //   child: SvgBuilder(svg: locationSvg),
                        // ),
                        suffixIcon: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: MoreIcon(),
                        ),
                      ),
                    ),
                  ),
                ],
              )
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
