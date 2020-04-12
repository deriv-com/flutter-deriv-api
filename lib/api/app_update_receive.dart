/// generated automatically from flutter_deriv_api|lib/api/app_update_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'app_update_receive.g.dart';

/// JSON conversion for 'app_update_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppUpdateResponse extends Response {
  /// Initialize AppUpdateResponse
  const AppUpdateResponse({
    this.appUpdate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory AppUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateResponseFromJson(json);

  // Properties
  /// Information of the updated application.
  final Map<String, dynamic> appUpdate;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppUpdateResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppUpdateResponse copyWith({
    Map<String, dynamic> appUpdate,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      AppUpdateResponse(
        appUpdate: appUpdate ?? this.appUpdate,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
