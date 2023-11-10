import 'package:bnbit_app/data_model/language/language_model.dart';
import 'package:bnbit_app/ui/bottom_sheets/basic_bottom_sheet.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/utils/country_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get/get.dart';

class CountryPickerBottomSheetArguments {
  final Function(Country)? onCountrySelected;
  final bool showDialCode;
  final bool showFlag;

  const CountryPickerBottomSheetArguments({
    this.onCountrySelected,
    this.showDialCode = true,
    this.showFlag = true,
  });
}

class CountryPickerSheet extends StatefulWidget {
  final CountryPickerBottomSheetArguments args;
  final Function(SheetResponse<Country>) completer;
  final SheetRequest request;

  const CountryPickerSheet({
    required this.completer,
    required this.request,
    Key? key,
    this.args = const CountryPickerBottomSheetArguments(),
  }) : super(key: key);

  @override
  _CountryPickerBottomSheetState createState() =>
      _CountryPickerBottomSheetState();
}

class _CountryPickerBottomSheetState extends State<CountryPickerSheet> {
  List<Country> allCountries =
      countryList.map((country) => Country.fromJson(country)).toList();
  late List<Country> _filteredCountries = allCountries;

  late final TextEditingController _controller = TextEditingController()
    ..addListener(_handleQuery);

  void _handleQuery() {
    final String query = _controller.text;

    if (query.isNotEmpty) {
      _filteredCountries = allCountries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredCountries = allCountries;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FrostedBottomSheet(
      child: SizedBox(
        height: screenHeight(context) * 0.63,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              //  verticalSpaceSmall,
              verticalSpaceMedium,
              Text(
                'Select Country',
                style: ktsMediumDarkTextStyle(context)
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 17),
              ),
              verticalSpaceSmall,
              verticalSpaceTiny,
              InputField(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).colorScheme.surface,
                ),
                hasFocusedBorder: true,
                contentPadding: const EdgeInsets.fromLTRB(18, 4, 4, 4),
                fieldHeight: 49,
                controller: _controller,
                placeholder: 'Search',
                maxLine: 1,
              ),
              verticalSpaceSmall,
              verticalSpaceTiny,
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(
                    height: 1.5,
                  ),
                  itemCount: _filteredCountries.length,
                  itemBuilder: (_, i) {
                    final country = _filteredCountries[i];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      onTap: () {
                        widget.completer.call(
                          SheetResponse(data: country),
                        );
                      },
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.args.showFlag) ...[
                            Image.asset(
                              'assets/flags/' + country.flag,
                              width: 22,
                            ),
                            horizontalSpaceSmall,
                          ],
                          // Icon(
                          //   Icons.chevron_right_rounded,
                          //   color: Theme.of(context).colorScheme. tertiary,
                          //   size: 20,
                          // )
                        ],
                      ),
                      title: Text(
                        country.name,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
