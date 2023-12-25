import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'time_selection_sheet_model.dart';

class TimeSelectionSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const TimeSelectionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return ViewModelBuilder<TimeSelectionSheetViewModel>.reactive(
      builder: (context, model, child) => FrostedBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpaceLarge,
            SizedBox(
              height: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    textStyle: const TextStyle(color: Colors.white),
                    dateTimePickerTextStyle: TextStyle(color: kcDark),
                  ),
                ),
                child: CupertinoDatePicker(
                  onDateTimeChanged: model.setTime,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime(
                    now.year,
                    now.month,
                    now.day,
                    request.data?.hour ?? 8,
                    request.data?.minute ?? 0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AppButton(
                title: 'Done',
                onTap: () {
                  SheetResponse<TimeOfDay>? response = SheetResponse<TimeOfDay>(
                      data: model.selectedTime != null
                          ? TimeOfDay(
                              hour: model.selectedTime!.hour,
                              minute: model.selectedTime!.minute,
                            )
                          : null);

                  completer(response);
                },
              ),
            ),
            verticalSpaceMedium
          ],
        ),
      ),
      viewModelBuilder: () => TimeSelectionSheetViewModel(),
    );
  }
}
