/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_get_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'app_get_receive.g.dart';

/// JSON conversion for 'app_get_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class AppGetResponse extends Response {
  /// Initialize AppGetResponse
  const AppGetResponse({
    this.appGet,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory AppGetResponse.fromJson(Map<String, dynamic> json) =>
      _$AppGetResponseFromJson(json);

  // Properties
  /// The information of the requested application.
  final Map<String, dynamic> appGet;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$AppGetResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  AppGetResponse copyWith({
    Map<String, dynamic> appGet,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppGetResponse(
        appGet: appGet ?? this.appGet,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
