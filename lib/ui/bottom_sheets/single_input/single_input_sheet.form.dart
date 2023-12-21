// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String InputValueKey = 'input';

final Map<String, TextEditingController>
    _SingleInputSheetTextEditingControllers = {};

final Map<String, FocusNode> _SingleInputSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _SingleInputSheetTextValidations =
    {
  InputValueKey: null,
};

mixin $SingleInputSheet {
  TextEditingController get inputController =>
      _getFormTextEditingController(InputValueKey);

  FocusNode get inputFocusNode => _getFormFocusNode(InputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SingleInputSheetTextEditingControllers.containsKey(key)) {
      return _SingleInputSheetTextEditingControllers[key]!;
    }

    _SingleInputSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SingleInputSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SingleInputSheetFocusNodes.containsKey(key)) {
      return _SingleInputSheetFocusNodes[key]!;
    }
    _SingleInputSheetFocusNodes[key] = FocusNode();
    return _SingleInputSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    inputController.addListener(() => _updateFormData(model));

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

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          InputValueKey: inputController.text,
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

    for (var controller in _SingleInputSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SingleInputSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _SingleInputSheetTextEditingControllers.clear();
    _SingleInputSheetFocusNodes.clear();
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

  set inputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({InputValueKey: value}),
    );

    if (_SingleInputSheetTextEditingControllers.containsKey(InputValueKey)) {
      _SingleInputSheetTextEditingControllers[InputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasInput =>
      this.formValueMap.containsKey(InputValueKey) &&
      (inputValue?.isNotEmpty ?? false);

  bool get hasInputValidationMessage =>
      this.fieldsValidationMessages[InputValueKey]?.isNotEmpty ?? false;

  String? get inputValidationMessage =>
      this.fieldsValidationMessages[InputValueKey];
}

extension Methods on FormStateHelper {
  setInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    inputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      InputValueKey: getValidationMessage(InputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SingleInputSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SingleInputSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      InputValueKey: getValidationMessage(InputValueKey),
    });
