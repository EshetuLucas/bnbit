// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PlaceValueKey = 'place';
const String PhoneNumberValueKey = 'phoneNumber';
const String LableValueKey = 'lable';

final Map<String, TextEditingController>
    _BusinessLocationsViewTextEditingControllers = {};

final Map<String, FocusNode> _BusinessLocationsViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _BusinessLocationsViewTextValidations = {
  PlaceValueKey: null,
  PhoneNumberValueKey: null,
  LableValueKey: null,
};

mixin $BusinessLocationsView {
  TextEditingController get placeController =>
      _getFormTextEditingController(PlaceValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get lableController =>
      _getFormTextEditingController(LableValueKey);

  FocusNode get placeFocusNode => _getFormFocusNode(PlaceValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get lableFocusNode => _getFormFocusNode(LableValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BusinessLocationsViewTextEditingControllers.containsKey(key)) {
      return _BusinessLocationsViewTextEditingControllers[key]!;
    }

    _BusinessLocationsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BusinessLocationsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BusinessLocationsViewFocusNodes.containsKey(key)) {
      return _BusinessLocationsViewFocusNodes[key]!;
    }
    _BusinessLocationsViewFocusNodes[key] = FocusNode();
    return _BusinessLocationsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    placeController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    lableController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    placeController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    lableController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PlaceValueKey: placeController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          LableValueKey: lableController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _BusinessLocationsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BusinessLocationsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BusinessLocationsViewTextEditingControllers.clear();
    _BusinessLocationsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get placeValue => this.formValueMap[PlaceValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get lableValue => this.formValueMap[LableValueKey] as String?;

  set placeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PlaceValueKey: value}),
    );

    if (_BusinessLocationsViewTextEditingControllers.containsKey(
        PlaceValueKey)) {
      _BusinessLocationsViewTextEditingControllers[PlaceValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_BusinessLocationsViewTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _BusinessLocationsViewTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set lableValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LableValueKey: value}),
    );

    if (_BusinessLocationsViewTextEditingControllers.containsKey(
        LableValueKey)) {
      _BusinessLocationsViewTextEditingControllers[LableValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPlace =>
      this.formValueMap.containsKey(PlaceValueKey) &&
      (placeValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasLable =>
      this.formValueMap.containsKey(LableValueKey) &&
      (lableValue?.isNotEmpty ?? false);

  bool get hasPlaceValidationMessage =>
      this.fieldsValidationMessages[PlaceValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasLableValidationMessage =>
      this.fieldsValidationMessages[LableValueKey]?.isNotEmpty ?? false;

  String? get placeValidationMessage =>
      this.fieldsValidationMessages[PlaceValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get lableValidationMessage =>
      this.fieldsValidationMessages[LableValueKey];
}

extension Methods on FormStateHelper {
  setPlaceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PlaceValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setLableValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LableValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    placeValue = '';
    phoneNumberValue = '';
    lableValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PlaceValueKey: getValidationMessage(PlaceValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      LableValueKey: getValidationMessage(LableValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BusinessLocationsViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BusinessLocationsViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PlaceValueKey: getValidationMessage(PlaceValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      LableValueKey: getValidationMessage(LableValueKey),
    });
