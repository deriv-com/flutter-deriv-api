/// generated automatically from flutter_deriv_api|lib/api/paymentagent_list_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'paymentagent_list_send.g.dart';

/// JSON conversion for 'paymentagent_list_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentListRequest extends Request {
  /// Initialize PaymentagentListRequest
  const PaymentagentListRequest({
    this.currency,
    this.paymentagentList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'paymentagent_list',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory PaymentagentListRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentListRequestFromJson(json);

  // Properties
  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  final String currency;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  final String paymentagentList;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$PaymentagentListRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  PaymentagentListRequest copyWith({
    String currency,
    String paymentagentList,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      PaymentagentListRequest(
        currency: currency ?? this.currency,
        paymentagentList: paymentagentList ?? this.paymentagentList,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
