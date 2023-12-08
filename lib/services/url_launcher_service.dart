import 'dart:io';
import 'package:bnbit_app/app/app.logger.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  final log = getLogger('UrlLauncherService');

  Future<void> openLink(String url) async {
    log.i('url:$url');
    final Uri linkUri = Uri.parse(url);
    final urlString = linkUri;
    log.i('urlString:$urlString');

    if (await canLaunchUrl(urlString)) {
      await launchUrl(urlString);
    } else {
      throw UrlLauncherServiceException('Could not launch email client');
    }
  }

  Future<void> sendEmail(String? email) async {
    if (email == null || email.isEmpty) {
      return;
    }
    log.i('email:$email');
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    final emailLaunchUrlString = emailLaunchUri;

    if (await canLaunchUrl(emailLaunchUrlString)) {
      await launchUrl(emailLaunchUrlString);
    } else {
      throw UrlLauncherServiceException('Could not launch email client');
    }
  }

  Future<void> makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    log.i('phoneNumber:$phoneNumber');
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    log.v(launchUri);
    await launchUrl(launchUri);
  }

  Future<void> sendSMS(String? phoneNumber,
      {Map<String, String> query = const {}}) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    log.i('phoneNumber:$phoneNumber');
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      query: query.isNotEmpty
          ? encodeQueryParameters(
              query,
            )
          : null,
    );
    await launchUrl(smsUri);
  }

  Future<void> openWhatsapp(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }

    final whatsappUrlAndroid = Uri.parse('whatsapp://send?phone=$phoneNumber');

    final whatsappUrlIOS = Uri.parse('https://wa.me/$phoneNumber');

    switch (Platform.operatingSystem) {
      case 'android':
        if (await canLaunchUrl(whatsappUrlAndroid)) {
          await launchUrl(whatsappUrlAndroid);
        } else {}
        break;
      case 'ios':
        if (await canLaunchUrl(whatsappUrlIOS)) {
          await launchUrl(whatsappUrlIOS);
        } else {}
        break;
      default:
        break;
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}

class UrlLauncherServiceException {
  final String exception;

  UrlLauncherServiceException(this.exception);

  @override
  String toString() {
    return '''
    UrlLauncherServiceException: $exception
    ''';
  }
}
