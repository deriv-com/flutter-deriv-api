import 'package:meta/meta.dart';

import '../../basic_api/generated/mt5_password_check_receive.dart';
import '../../basic_api/generated/mt5_password_check_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Mt5 password check response model class
abstract class Mt5PasswordCheckResponseModel {
  /// Initializes
  Mt5PasswordCheckResponseModel({
    @required this.mt5PasswordCheck,
  });

  /// `1` on success
  final int mt5PasswordCheck;
}

/// Mt5 password check response class
class Mt5PasswordCheckResponse extends Mt5PasswordCheckResponseModel {
  /// Initializes
  Mt5PasswordCheckResponse({
    @required int mt5PasswordCheck,
  }) : super(
          mt5PasswordCheck: mt5PasswordCheck,
        );

  /// Creates an instance from JSON
  factory Mt5PasswordCheckResponse.fromJson(
    dynamic mt5PasswordCheckJson,
  ) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheckJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['mt5_password_check'] = mt5PasswordCheck;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Validates the main password for the MT5 user.
  ///
  /// For parameters information refer to [Mt5PasswordCheckRequest].
  /// Throws a [MT5Exception] if API response contains an error
  static Future<Mt5PasswordCheckResponse> checkPassword(
      Mt5PasswordCheckSend request) async {
    final Mt5PasswordCheckReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          MT5Exception(baseExceptionModel: baseExceptionModel),
    );

    return Mt5PasswordCheckResponse.fromJson(response.mt5PasswordCheck);
  }

  /// Creates a copy of instance with given parameters
  Mt5PasswordCheckResponse copyWith({
    int mt5PasswordCheck,
  }) =>
      Mt5PasswordCheckResponse(
        mt5PasswordCheck: mt5PasswordCheck ?? this.mt5PasswordCheck,
      );
}
