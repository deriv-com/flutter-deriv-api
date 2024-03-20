import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/trading_platform_password_reset_response_extended.dart';
import 'package:flutter_deriv_api/api/response/trading_platform_password_reset_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/trading_platform_password_reset_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Reset trading platform password', () async {
    final TradingPlatformPasswordResetResponse passwordResetResponse =
        await TradingPlatformPasswordResetResponseExtended.resetPassword(
      request: const TradingPlatformPasswordResetRequest(
        newPassword: 'Tst12345#',
        platform: 'dxtrade',
        verificationCode: 'VYt3xeeu',
      ),
    );

    expect(passwordResetResponse.tradingPlatformPasswordReset, true);
  });
}
