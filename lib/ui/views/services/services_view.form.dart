// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PriceValueKey = 'price';
const String ServiceValueKey = 'service';

final Map<String, TextEditingController> _ServicesViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ServicesViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ServicesViewTextValidations = {
  PriceValueKey: null,
  ServiceValueKey: null,
};

mixin $ServicesView {
  TextEditingController get priceController =>
      _getFormTextEditingController(PriceValueKey);
  TextEditingController get serviceController =>
      _getFormTextEditingController(ServiceValueKey);

  FocusNode get priceFocusNode => _getFormFocusNode(PriceValueKey);
  FocusNode get serviceFocusNode => _getFormFocusNode(ServiceValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ServicesViewTextEditingControllers.containsKey(key)) {
      return _ServicesViewTextEditingControllers[key]!;
    }

    _ServicesViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ServicesViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ServicesViewFocusNodes.containsKey(key)) {
      return _ServicesViewFocusNodes[key]!;
    }
    _ServicesViewFocusNodes[key] = FocusNode();
    return _ServicesViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    priceController.addListener(() => _updateFormData(model));
    serviceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    priceController.addListener(() => _updateFormData(model));
    serviceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PriceValueKey: priceController.text,
          ServiceValueKey: serviceController.text,
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

    for (var controller in _ServicesViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ServicesViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ServicesViewTextEditingControllers.clear();
    _ServicesViewFocusNodes.clear();
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

  String? get priceValue => this.formValueMap[PriceValueKey] as String?;
  String? get serviceValue => this.formValueMap[ServiceValueKey] as String?;

  set priceValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PriceValueKey: value}),
    );

    if (_ServicesViewTextEditingControllers.containsKey(PriceValueKey)) {
      _ServicesViewTextEditingControllers[PriceValueKey]?.text = value ?? '';
    }
  }

  set serviceValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ServiceValueKey: value}),
    );

    if (_ServicesViewTextEditingControllers.containsKey(ServiceValueKey)) {
      _ServicesViewTextEditingControllers[ServiceValueKey]?.text = value ?? '';
    }
  }

  bool get hasPrice =>
      this.formValueMap.containsKey(PriceValueKey) &&
      (priceValue?.isNotEmpty ?? false);
  bool get hasService =>
      this.formValueMap.containsKey(ServiceValueKey) &&
      (serviceValue?.isNotEmpty ?? false);

  bool get hasPriceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey]?.isNotEmpty ?? false;
  bool get hasServiceValidationMessage =>
      this.fieldsValidationMessages[ServiceValueKey]?.isNotEmpty ?? false;

  String? get priceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey];
  String? get serviceValidationMessage =>
      this.fieldsValidationMessages[ServiceValueKey];
}

extension Methods on FormStateHelper {
  setPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PriceValueKey] = validationMessage;
  setServiceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ServiceValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    priceValue = '';
    serviceValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PriceValueKey: getValidationMessage(PriceValueKey),
      ServiceValueKey: getValidationMessage(ServiceValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ServicesViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ServicesViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PriceValueKey: getValidationMessage(PriceValueKey),
      ServiceValueKey: getValidationMessage(ServiceValueKey),
    });
