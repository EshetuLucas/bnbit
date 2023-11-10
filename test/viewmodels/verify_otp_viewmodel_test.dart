import 'package:flutter_test/flutter_test.dart';
import 'package:bnbit_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('VerifyOtpViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

