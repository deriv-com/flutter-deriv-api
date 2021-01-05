/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// App get send class
class AppGetSend extends Request {
  /// Initialize AppGetSend
  const AppGetSend({
    @required this.appGet,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'app_get',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppGetSend.fromJson(Map<String, dynamic> json) => AppGetSend(
        appGet: json['app_get'] as int,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Application app_id
  final int appGet;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'app_get': appGet,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AppGetSend copyWith({
    int appGet,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AppGetSend(
        appGet: appGet ?? this.appGet,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
