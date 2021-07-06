/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// App delete send class.
class AppDeleteSend extends Request {
  /// Initialize AppDeleteSend.
  const AppDeleteSend({
    required this.appDelete,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'app_delete',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AppDeleteSend.fromJson(Map<String, dynamic> json) => AppDeleteSend(
        appDelete: json['app_delete'] as int?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Application app_id
  final int? appDelete;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_delete': appDelete,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteSend copyWith({
    int? appDelete,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AppDeleteSend(
        appDelete: appDelete ?? this.appDelete,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
