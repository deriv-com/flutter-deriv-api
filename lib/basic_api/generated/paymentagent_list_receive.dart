/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/paymentagent_list_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'paymentagent_list_receive.g.dart';

/// JSON conversion for 'paymentagent_list_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentListResponse extends Response {
  /// Initialize PaymentagentListResponse
  const PaymentagentListResponse({
    this.paymentagentList,
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
  factory PaymentagentListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentListResponseFromJson(json);

  /// Payment Agent List
  final Map<String, dynamic> paymentagentList;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentListResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  PaymentagentListResponse copyWith({
    Map<String, dynamic> paymentagentList,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PaymentagentListResponse(
        paymentagentList: paymentagentList ?? this.paymentagentList,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
