import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';
import 'package:flutter_deriv_api/api/user/models/tnc_approval_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Terms and conditions approval
class TNCApproval extends TNCApprovalModel {
  /// Initializes
  TNCApproval({
    bool approved,
  }) : super(approved: approved);

  /// Generates an instance from response
  factory TNCApproval.fromResponse(TncApprovalResponse response) =>
      TNCApproval(approved: getBool(response.tncApproval));

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  TNCApproval copyWith({
    bool approved,
  }) =>
      TNCApproval(
        approved: approved ?? this.approved,
      );

  /// Approve the latest version of terms and conditions.
  ///
  /// For parameters information refer to [TncApprovalRequest].
  /// Throws a [UserException] if API response contains an error
  static Future<TNCApproval> verify(
    TncApprovalRequest request,
  ) async {
    final TncApprovalResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({String code, String message}) =>
          UserException(code: code, message: message),
    );

    return TNCApproval.fromResponse(response);
  }
}
