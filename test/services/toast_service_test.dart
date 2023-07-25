import 'package:flutter_test/flutter_test.dart';
import 'package:absensi_web_admin/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ToastServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
