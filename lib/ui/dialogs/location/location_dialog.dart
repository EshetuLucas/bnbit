import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'location_dialog_model.dart';

const double _graphicSize = 60;

class LocationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const LocationDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: kcWhite,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceMedium,
              Text(
                request.title ?? '',
                style: ktsSmall(context),
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              Text(
                request.description ??
                    'Location must be turned on so we can know where the place is located at',
                style: ktsSmall(context).copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Okay',
                        height: 45.0,
                        onTap: () =>
                            completer.call((DialogResponse(confirmed: true))),
                      ),
                    ),
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () =>
                    //         completer.call((DialogResponse(confirmed: true))),
                    //     child: Align(
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         request.additionalButtonTitle ?? 'Yes',
                    //         style: ktsGreenSmallTextStyle,
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
