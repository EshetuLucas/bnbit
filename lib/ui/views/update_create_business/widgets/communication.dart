import 'package:bnbit_app/ui/common/ui_helpers.dart';
import 'package:bnbit_app/ui/views/update_create_business/update_create_business_viewmodel.dart';
import 'package:bnbit_app/ui/widgets/input_error_message.dart';
import 'package:bnbit_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'section_title.dart';

class CommunicationSection extends ViewModelWidget<UpdateCreateBusinessViewModel> {
  const CommunicationSection({
    super.key,
    required this.phoneController,
    required this.emailController,
    required this.webisteController,
    required this.instagramController,
    required this.telegramController,
  });

  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController webisteController;
  final TextEditingController instagramController;
  final TextEditingController telegramController;

  @override
  Widget build(
    BuildContext context,
    UpdateCreateBusinessViewModel viewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Ways for people to reach you'),
        verticalSpaceSmall,
        verticalSpaceSmall,
        InputField(
          placeholder: 'contact@examplebusiness.com',
          labelText: 'Email (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('email'),
          hasFocusedBorder: true,
          textInputType: TextInputType.emailAddress,
          isReadOnly: viewModel.isBusy,
          controller: emailController,
        ),
        if (viewModel.hasCommunicationFormatError('email')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['email']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://www.examplebusiness.com',
          labelText: 'Website (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('website'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: webisteController,
        ),
        if (viewModel.hasCommunicationFormatError('website')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['website']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://www.instagram.com/example_username/',
          labelText: 'Instagram (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('instagram'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: instagramController,
        ),
        if (viewModel.hasCommunicationFormatError('instagram')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['instagram']!),
          verticalSpaceSmall,
        ],
        verticalSpaceSmall,
        verticalSpaceTiny,
        InputField(
          placeholder: 'https://t.me/example_channel',
          labelText: 'Telegram (optional)',
          maxLine: 1,
          onChanged: (_) => viewModel.clearFormatErrorMessage('telegram'),
          hasFocusedBorder: true,
          textInputType: TextInputType.name,
          isReadOnly: viewModel.isBusy,
          controller: telegramController,
        ),
        if (viewModel.hasCommunicationFormatError('telegram')) ...[
          ValidationMessage(
              title: viewModel.communicationFormatChecker['telegram']!),
          verticalSpaceSmall,
        ],
      ],
    );
  }
}
