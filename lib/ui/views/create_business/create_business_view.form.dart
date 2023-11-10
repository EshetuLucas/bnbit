// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';
const String EmailValueKey = 'email';
const String WebisteValueKey = 'webiste';
const String InstagramValueKey = 'instagram';
const String TelegramValueKey = 'telegram';
const String PhoneValueKey = 'phone';

final Map<String, TextEditingController>
    _CreateBusinessViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateBusinessViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateBusinessViewTextValidations = {
  NameValueKey: null,
  DescriptionValueKey: null,
  EmailValueKey: null,
  WebisteValueKey: null,
  InstagramValueKey: null,
  TelegramValueKey: null,
  PhoneValueKey: null,
};

mixin $CreateBusinessView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get webisteController =>
      _getFormTextEditingController(WebisteValueKey);
  TextEditingController get instagramController =>
      _getFormTextEditingController(InstagramValueKey);
  TextEditingController get telegramController =>
      _getFormTextEditingController(TelegramValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get webisteFocusNode => _getFormFocusNode(WebisteValueKey);
  FocusNode get instagramFocusNode => _getFormFocusNode(InstagramValueKey);
  FocusNode get telegramFocusNode => _getFormFocusNode(TelegramValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateBusinessViewTextEditingControllers.containsKey(key)) {
      return _CreateBusinessViewTextEditingControllers[key]!;
    }

    _CreateBusinessViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateBusinessViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateBusinessViewFocusNodes.containsKey(key)) {
      return _CreateBusinessViewFocusNodes[key]!;
    }
    _CreateBusinessViewFocusNodes[key] = FocusNode();
    return _CreateBusinessViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    webisteController.addListener(() => _updateFormData(model));
    instagramController.addListener(() => _updateFormData(model));
    telegramController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    webisteController.addListener(() => _updateFormData(model));
    instagramController.addListener(() => _updateFormData(model));
    telegramController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          DescriptionValueKey: descriptionController.text,
          EmailValueKey: emailController.text,
          WebisteValueKey: webisteController.text,
          InstagramValueKey: instagramController.text,
          TelegramValueKey: telegramController.text,
          PhoneValueKey: phoneController.text,
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

    for (var controller in _CreateBusinessViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateBusinessViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateBusinessViewTextEditingControllers.clear();
    _CreateBusinessViewFocusNodes.clear();
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

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get webisteValue => this.formValueMap[WebisteValueKey] as String?;
  String? get instagramValue => this.formValueMap[InstagramValueKey] as String?;
  String? get telegramValue => this.formValueMap[TelegramValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(NameValueKey)) {
      _CreateBusinessViewTextEditingControllers[NameValueKey]?.text =
          value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({DescriptionValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateBusinessViewTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(EmailValueKey)) {
      _CreateBusinessViewTextEditingControllers[EmailValueKey]?.text =
          value ?? '';
    }
  }

  set webisteValue(String? value) {
    this.setData(
      this.formValueMap..addAll({WebisteValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(
        WebisteValueKey)) {
      _CreateBusinessViewTextEditingControllers[WebisteValueKey]?.text =
          value ?? '';
    }
  }

  set instagramValue(String? value) {
    this.setData(
      this.formValueMap..addAll({InstagramValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(
        InstagramValueKey)) {
      _CreateBusinessViewTextEditingControllers[InstagramValueKey]?.text =
          value ?? '';
    }
  }

  set telegramValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TelegramValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(
        TelegramValueKey)) {
      _CreateBusinessViewTextEditingControllers[TelegramValueKey]?.text =
          value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_CreateBusinessViewTextEditingControllers.containsKey(PhoneValueKey)) {
      _CreateBusinessViewTextEditingControllers[PhoneValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasWebiste =>
      this.formValueMap.containsKey(WebisteValueKey) &&
      (webisteValue?.isNotEmpty ?? false);
  bool get hasInstagram =>
      this.formValueMap.containsKey(InstagramValueKey) &&
      (instagramValue?.isNotEmpty ?? false);
  bool get hasTelegram =>
      this.formValueMap.containsKey(TelegramValueKey) &&
      (telegramValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasWebisteValidationMessage =>
      this.fieldsValidationMessages[WebisteValueKey]?.isNotEmpty ?? false;
  bool get hasInstagramValidationMessage =>
      this.fieldsValidationMessages[InstagramValueKey]?.isNotEmpty ?? false;
  bool get hasTelegramValidationMessage =>
      this.fieldsValidationMessages[TelegramValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get webisteValidationMessage =>
      this.fieldsValidationMessages[WebisteValueKey];
  String? get instagramValidationMessage =>
      this.fieldsValidationMessages[InstagramValueKey];
  String? get telegramValidationMessage =>
      this.fieldsValidationMessages[TelegramValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setWebisteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WebisteValueKey] = validationMessage;
  setInstagramValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[InstagramValueKey] = validationMessage;
  setTelegramValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TelegramValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    descriptionValue = '';
    emailValue = '';
    webisteValue = '';
    instagramValue = '';
    telegramValue = '';
    phoneValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      WebisteValueKey: getValidationMessage(WebisteValueKey),
      InstagramValueKey: getValidationMessage(InstagramValueKey),
      TelegramValueKey: getValidationMessage(TelegramValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateBusinessViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateBusinessViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      WebisteValueKey: getValidationMessage(WebisteValueKey),
      InstagramValueKey: getValidationMessage(InstagramValueKey),
      TelegramValueKey: getValidationMessage(TelegramValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
    });
