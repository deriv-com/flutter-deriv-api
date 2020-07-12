/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_delete_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// AppDeleteRequest class
class AppDeleteRequest extends Request {
  /// Initialize AppDeleteRequest
  const AppDeleteRequest({
    @required this.appDelete,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_delete',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppDeleteRequest.fromJson(Map<String, dynamic> json) =>
      AppDeleteRequest(
        appDelete: json['app_delete'] as int,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Application app_id
  final int appDelete;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_delete': appDelete,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppDeleteRequest copyWith({
    int appDelete,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppDeleteRequest(
        appDelete: appDelete ?? this.appDelete,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
