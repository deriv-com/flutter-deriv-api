/// generated automatically from flutter_deriv_api|lib/basic_api/generated/sell_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'sell_receive.g.dart';

/// JSON conversion for 'sell_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SellResponse extends Response {
  /// Initialize SellResponse
  const SellResponse({
    this.sell,
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
  factory SellResponse.fromJson(Map<String, dynamic> json) =>
      _$SellResponseFromJson(json);

  // Properties
  /// Receipt for the transaction
  final Map<String, dynamic> sell;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$SellResponseToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  SellResponse copyWith({
    Map<String, dynamic> sell,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SellResponse(
        sell: sell ?? this.sell,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
