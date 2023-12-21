// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String InputValueKey = 'input';
const String PriceValueKey = 'price';

final Map<String, TextEditingController>
    _InputFieldSheetTextEditingControllers = {};

final Map<String, FocusNode> _InputFieldSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _InputFieldSheetTextValidations =
    {
  InputValueKey: null,
  PriceValueKey: null,
};

mixin $InputFieldSheet {
  TextEditingController get inputController =>
      _getFormTextEditingController(InputValueKey);
  TextEditingController get priceController =>
      _getFormTextEditingController(PriceValueKey);

  FocusNode get inputFocusNode => _getFormFocusNode(InputValueKey);
  FocusNode get priceFocusNode => _getFormFocusNode(PriceValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_InputFieldSheetTextEditingControllers.containsKey(key)) {
      return _InputFieldSheetTextEditingControllers[key]!;
    }

    _InputFieldSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _InputFieldSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_InputFieldSheetFocusNodes.containsKey(key)) {
      return _InputFieldSheetFocusNodes[key]!;
    }
    _InputFieldSheetFocusNodes[key] = FocusNode();
    return _InputFieldSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    inputController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    inputController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          InputValueKey: inputController.text,
          PriceValueKey: priceController.text,
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

    for (var controller in _InputFieldSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _InputFieldSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _InputFieldSheetTextEditingControllers.clear();
    _InputFieldSheetFocusNodes.clear();
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

  String? get inputValue => this.formValueMap[InputValueKey] as String?;
  String? get priceValue => this.formValueMap[PriceValueKey] as String?;

  set inputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({InputValueKey: value}),
    );

    if (_InputFieldSheetTextEditingControllers.containsKey(InputValueKey)) {
      _InputFieldSheetTextEditingControllers[InputValueKey]?.text = value ?? '';
    }
  }

  set priceValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PriceValueKey: value}),
    );

    if (_InputFieldSheetTextEditingControllers.containsKey(PriceValueKey)) {
      _InputFieldSheetTextEditingControllers[PriceValueKey]?.text = value ?? '';
    }
  }

  bool get hasInput =>
      this.formValueMap.containsKey(InputValueKey) &&
      (inputValue?.isNotEmpty ?? false);
  bool get hasPrice =>
      this.formValueMap.containsKey(PriceValueKey) &&
      (priceValue?.isNotEmpty ?? false);

  bool get hasInputValidationMessage =>
      this.fieldsValidationMessages[InputValueKey]?.isNotEmpty ?? false;
  bool get hasPriceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey]?.isNotEmpty ?? false;

  String? get inputValidationMessage =>
      this.fieldsValidationMessages[InputValueKey];
  String? get priceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey];
}

extension Methods on FormStateHelper {
  setInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InputValueKey] = validationMessage;
  setPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PriceValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    inputValue = '';
    priceValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      InputValueKey: getValidationMessage(InputValueKey),
      PriceValueKey: getValidationMessage(PriceValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _InputFieldSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _InputFieldSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      InputValueKey: getValidationMessage(InputValueKey),
      PriceValueKey: getValidationMessage(PriceValueKey),
    });
