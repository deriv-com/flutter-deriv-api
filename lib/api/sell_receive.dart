/// generated automatically from flutter_deriv_api|lib/api/sell_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'sell_receive.g.dart';

/// JSON conversion for 'sell_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellResponse extends Response {
  /// Initialize SellResponse
  const SellResponse({
    this.sell,
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
  factory SellResponse.fromJson(Map<String, dynamic> json) =>
      _$SellResponseFromJson(json);

  // Properties
  /// Receipt for the transaction
  final Map<String, dynamic> sell;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SellResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  SellResponse copyWith({
    Map<String, dynamic> sell,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
