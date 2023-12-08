import 'dart:convert';

import 'package:bnbit_app/data_model/address/address.dart';
import 'package:bnbit_app/data_model/business/business_model.dart';
import 'package:bnbit_app/ui/common/app_colors.dart';
import 'package:bnbit_app/ui/common/shared_styles.dart';
import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/widgets/app_button.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:bnbit_app/ui/widgets/map_view.dart';
import 'package:bnbit_app/ui/widgets/spinner.dart';
import 'package:bnbit_app/ui/widgets/svg_builder.dart';
import 'package:bnbit_app/utils/asset_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked_annotations.dart';
import 'select_location_view.form.dart';
import 'select_location_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "place",
    ),
    FormTextField(
      name: "phoneNumber",
    ),
    FormTextField(
      name: "lable",
    ),
  ],
)
class SelectLocationView extends StackedView<SelectLocationViewModel>
    with $SelectLocationView {
  SelectLocationView({
    Key? key,
    required this.businesses,
  }) : super(key: key);

  final List<Business> businesses;

  @override
  void onDispose(SelectLocationViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  void onViewModelReady(SelectLocationViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SelectLocationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: viewModel.setCurrentLocation,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(
                    12,
                  )),
                  color: kcPrimaryColor.withOpacity(0.15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (viewModel.isBusy) ...[
                      const SizedBox(
                        height: 8,
                        child: Spinner(
                          size: 8,
                        ),
                      ),
                      horizontalSpaceTiny,
                    ],
                    Text(
                      'Get current location',
                      style: ktsSemibold(context).copyWith(
                        color: kcPrimaryColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpaceTiny,
            AppButton(
              enabled: viewModel.hasAddress,
              title: 'Confirm',
              onTap: viewModel.onConfirm,
            ),
            verticalSpaceTiny,
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMapPage(
            key: Key(viewModel.isBusy.toString()),
            lat: viewModel.currentLatLng.latitude,
            long: viewModel.currentLatLng.longitude,
            latlngs: const [],
            // markerbitmap: model.markerbitmap,
            // nearbyMarkerbitmap: model.nearbyMarkerbitmap,
            cameraTarget: LatLng(
              viewModel.currentLatLng.latitude,
              viewModel.currentLatLng.longitude,
            ),
            onMapCreated: viewModel.onMapCreated,
          ),
          SafeArea(
            child: Column(
              children: [
                verticalSpaceTiny,
                Row(
                  children: [
                    //AppBackButton(),
                    horizontalSpaceSmall,
                    InkWell(
                      onTap: viewModel.onClose,
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(top: 0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kcWhite,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.close,
                            color: kcPrimaryColor.withOpacity(0.6),
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                    Expanded(
                      child: InputField(
                        onChanged: viewModel.onChange,
                        autoFocus: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgBuilder(
                              svg: searchSvg,
                              color: kcDark700,
                            ),
                          ),
                        ),
                        hasFocusedBorder: true,
                        contentPadding: const EdgeInsets.fromLTRB(18, 4, 4, 4),
                        fieldHeight: 49,
                        controller: placeController,
                        placeholder: 'Search',
                        maxLine: 1,
                      ),
                    ),
                    horizontalSpaceSmall,
                    horizontalSpaceSmall,
                  ],
                ),
                verticalSpaceSmall,
                if (viewModel.showList)
                  Container(
                    color: kcWhite,
                    margin: appSymmetricEdgePadding,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      itemCount: viewModel.autoCompleteResults.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: appSymmetricEdgePadding,
                          child: InkWell(
                            onTap: () {
                              placeController.clear();
                              placeController.text = viewModel
                                      .autoCompleteResults[index].mainText ??
                                  '';

                              viewModel.onPlaceTap(index);
                              FocusScope.of(context).unfocus();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  const SvgBuilder(
                                    svg: locationSvg,
                                    height: 19,
                                  ),
                                  horizontalSpaceSmall,
                                  horizontalSpaceTiny,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          viewModel.autoCompleteResults[index]
                                                  .mainText ??
                                              '',
                                          style: ktsSmall(context),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Text(
                                            viewModel.autoCompleteResults[index]
                                                    .secondaryText ??
                                                '',
                                            style: ktsSmall(context)
                                                .copyWith(fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  SelectLocationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectLocationViewModel(placeController);
}

// import 'dart:convert';
// import 'package:bnbit_app/app/app.locator.dart';
// import 'package:bnbit_app/services/location_service.dart';
// import 'package:bnbit_app/ui/common/app_colors.dart';
// import 'package:bnbit_app/ui/common/ui_helpers.dart';
// import 'package:bnbit_app/ui/widgets/app_button.dart';
// import 'package:bnbit_app/ui/widgets/svg_builder.dart';
// import 'package:bnbit_app/utils/asset_helper.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;

// import 'package:bnbit_app/data_model/address/address.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// Color color = const Color(0xfffe8903);

// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen({super.key});

//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   BitmapDescriptor? currentLocation;
//   TextEditingController placeController = TextEditingController();

//   late final GoogleMapController _controller;
//   Position? _currentPosition;
//   LatLng _currentLatLng = const LatLng(27.671332124757402, 85.3125417636781);
//   final _locationService = locator<LocationService>();

//   @override
//   void initState() {
//     getLocation();
//     super.initState();
//   }

//   getLocation() async {
//     // WidgetsBinding.instance.addPostFrameCallback((_) async {
//     //var pp = await _locationService.getLocation();
//     // if (pp.name == LocationPermission.always) {
//     _currentPosition = Position(
//         longitude: 9.003429960888363,
//         latitude: 38.814238038050576,
//         timestamp: DateTime.now(),
//         accuracy: 2,
//         altitude: 2,
//         altitudeAccuracy: 2,
//         heading: 2,
//         headingAccuracy: 2,
//         speed: 2,
//         speedAccuracy: 2);

//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     _currentLatLng =
//         LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
//     setState(() {});
//   }

//   Widget autoComplete() {
//     return Container(
//       height: 48,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.rectangle,
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.8),
//                 blurRadius: 8.0,
//                 spreadRadius: 1,
//                 offset: const Offset(0, 4))
//           ],
//           borderRadius: BorderRadius.circular(12)),
//       child: TypeAheadFormField<Description?>(
//         onSuggestionSelected: (suggestion) {
//           setState(() {
//             placeController.text =
//                 suggestion?.structured_formatting?.main_text ?? "";
//           });
//         },
//         getImmediateSuggestions: true,
//         keepSuggestionsOnLoading: true,
//         textFieldConfiguration: TextFieldConfiguration(
//             controller: placeController,
//             decoration: InputDecoration(
//               isDense: false,
//               fillColor: Colors.transparent,
//               filled: false,
//               prefixIcon: const Icon(
//                 CupertinoIcons.search,
//                 color: kcPrimaryColor,
//               ),
//               suffixIcon: InkWell(
//                   onTap: () {
//                     setState(() {
//                       placeController.clear();
//                     });
//                   },
//                   child: const Icon(Icons.clear, color: Colors.red)),
//               // contentPadding:
//               //     const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//               hintText: "Enter location",
//               border: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               disabledBorder: InputBorder.none,
//             )),
//         itemBuilder: (context, Description? itemData) {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 35,
//                   width: 16,
//                   padding: const EdgeInsets.only(bottom: 14),
//                   child: const SvgBuilder(
//                     svg: locationSvg,
//                   ),
//                 ),
//                 horizontalSpaceTiny,
//                 horizontalSpaceTiny,
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${itemData?.structured_formatting?.main_text}",
//                         style: const TextStyle(color: kcPrimaryColor),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       ),
//                       Text(
//                           "${itemData?.structured_formatting?.secondary_text}"),
//                       const Divider()
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         noItemsFoundBuilder: (context) {
//           return Container(
//             height: 0,
//           );
//           //return SizedBox.shrink();
//         },
//         suggestionsCallback: (String pattern) async {
//           var predictionModel =
//               await Repo.placeAutoComplete(placeInput: pattern);

//           if (predictionModel != null) {
//             return predictionModel.predictions!.where((element) => element
//                 .description!
//                 .toLowerCase()
//                 .contains(pattern.toLowerCase()));
//           } else {
//             return [];
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       extendBody: true,
//       resizeToAvoidBottomInset: false,
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.dark,
//         child: _currentPosition == null
//             ? const Center(child: CircularProgressIndicator()
//                 //CircularProgressIndicator(),
//                 )
//             : Stack(
//                 children: [
//                   GoogleMap(
//                     myLocationButtonEnabled: false,
//                     myLocationEnabled: true,
//                     zoomControlsEnabled: false,
//                     initialCameraPosition:
//                         CameraPosition(zoom: 16, target: _currentLatLng),
//                     onMapCreated: (controller) async {
//                       setState(() {
//                         _controller = controller;
//                       });
//                       String val = "json/google_map_dark_light.json";
//                       var c = await rootBundle.loadString(val);
//                       _controller.setMapStyle(c);
//                     },
//                     markers: {
//                       Marker(
//                           markerId: const MarkerId("1"),
//                           // icon: currentLocation!,
//                           position: _currentLatLng)
//                     },
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           verticalSpaceSmall,
//                           autoComplete(),
//                           const SizedBox(
//                             height: 12,
//                           ),
//                           const Spacer(),
//                           confirmButton(),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget confirmButton() {
//     return AppButton(
//       title: 'Confirm',
//       onTap: () {
//         // _controller.animateCamera(CameraUpdate.newCameraPosition(
//         //     const CameraPosition(target: LatLng(0, 0))));
//       },
//     );
//   }
// }

class Repo {
  Repo._();
  static Future<PredictionModel?> placeAutoComplete(
      {required String placeInput}) async {
    try {
      Map<String, dynamic> querys = {
        'input': placeInput,
        'key': dotenv.env['MAP_KEY']!
      };
      final url = Uri.https(
          "maps.googleapis.com", "maps/api/place/autocomplete/json", querys);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return PredictionModel.fromJson(jsonDecode(response.body));
      } else {
        response.body;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }
}
