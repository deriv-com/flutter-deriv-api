/// generated automatically from flutter_deriv_api|lib/basic_api/generated/app_register_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'app_register_receive.g.dart';

/// JSON conversion for 'app_register_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AppRegisterResponse extends Response {
  /// Initialize AppRegisterResponse
  const AppRegisterResponse({
    this.appRegister,
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

  /// Creates instance from JSON
  factory AppRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AppRegisterResponseFromJson(json);

  // Properties
  /// The information of the created application.
  final Map<String, dynamic> appRegister;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AppRegisterResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AppRegisterResponse copyWith({
    Map<String, dynamic> appRegister,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      AppRegisterResponse(
        appRegister: appRegister ?? this.appRegister,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
