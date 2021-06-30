/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_send.json

import '../request.dart';

/// App get request class
class AppGetRequest extends Request {
  /// Initialize AppGetRequest
  const AppGetRequest({
    @required this.appGet,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'app_get',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppGetRequest.fromJson(Map<String, dynamic> json) => AppGetRequest(
        appGet: json['app_get'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Application app_id
  final int? appGet;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_get': appGet,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppGetRequest copyWith({
    int? appGet,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppGetRequest(
        appGet: appGet ?? this.appGet,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
