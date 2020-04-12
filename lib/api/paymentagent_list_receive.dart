/// generated automatically from flutter_deriv_api|lib/api/paymentagent_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'paymentagent_list_receive.g.dart';

/// JSON conversion for 'paymentagent_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentListResponse extends Response {
  /// Initialize PaymentagentListResponse
  const PaymentagentListResponse({
    this.paymentagentList,
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
  factory PaymentagentListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentListResponseFromJson(json);

  // Properties
  /// Payment Agent List
  final Map<String, dynamic> paymentagentList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentListResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PaymentagentListResponse copyWith({
    Map<String, dynamic> paymentagentList,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      PaymentagentListResponse(
        paymentagentList: paymentagentList ?? this.paymentagentList,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
