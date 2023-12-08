// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AddressValueKey = 'address';

final Map<String, TextEditingController>
    _AddressDetailSheetTextEditingControllers = {};

final Map<String, FocusNode> _AddressDetailSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddressDetailSheetTextValidations = {
  AddressValueKey: null,
};

mixin $AddressDetailSheet {
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);

  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddressDetailSheetTextEditingControllers.containsKey(key)) {
      return _AddressDetailSheetTextEditingControllers[key]!;
    }

    _AddressDetailSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddressDetailSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddressDetailSheetFocusNodes.containsKey(key)) {
      return _AddressDetailSheetFocusNodes[key]!;
    }
    _AddressDetailSheetFocusNodes[key] = FocusNode();
    return _AddressDetailSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AddressValueKey: addressController.text,
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

    for (var controller in _AddressDetailSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddressDetailSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _AddressDetailSheetTextEditingControllers.clear();
    _AddressDetailSheetFocusNodes.clear();
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

  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_AddressDetailSheetTextEditingControllers.containsKey(
        AddressValueKey)) {
      _AddressDetailSheetTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);

  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
}

extension Methods on FormStateHelper {
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    addressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddressDetailSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddressDetailSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
