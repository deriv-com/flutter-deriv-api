import 'package:meta/meta.dart';

import '../../basic_api/generated/copy_start_receive.dart';
import '../../basic_api/generated/copy_start_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Copy start response model class
abstract class CopyStartResponseModel {
  /// Initializes
  CopyStartResponseModel({
    @required this.copyStart,
  });

  /// Copy start confirmation. Returns 1 is success.
  final int copyStart;
}

/// Copy start response class
class CopyStartResponse extends CopyStartResponseModel {
  /// Initializes
  CopyStartResponse({
    @required int copyStart,
  }) : super(
          copyStart: copyStart,
        );

  /// Creates an instance from JSON
  factory CopyStartResponse.fromJson(
    dynamic copyStartJson,
  ) =>
      CopyStartResponse(
        copyStart: copyStartJson,
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['copy_start'] = copyStart;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Starts copy trader bets.
  ///
  /// For parameters information refer to [CopyStartRequest].
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyStartResponse> start(CopyStartSend request) async {
    final CopyStartReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopyStartResponse.fromJson(response.copyStart);
  }

  /// Creates a copy of instance with given parameters
  CopyStartResponse copyWith({
    int copyStart,
  }) =>
      CopyStartResponse(
        copyStart: copyStart ?? this.copyStart,
      );
}
