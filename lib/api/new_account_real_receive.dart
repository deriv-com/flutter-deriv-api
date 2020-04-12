/// generated automatically from flutter_deriv_api|lib/api/new_account_real_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'new_account_real_receive.g.dart';

/// JSON conversion for 'new_account_real_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class NewAccountRealResponse extends Response {
  /// Initialize NewAccountRealResponse
  NewAccountRealResponse({
    this.newAccountReal,
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
  factory NewAccountRealResponse.fromJson(Map<String, dynamic> json) =>
      _$NewAccountRealResponseFromJson(json);

  // Properties
  /// New real money account details
  final Map<String, dynamic> newAccountReal;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$NewAccountRealResponseToJson(this);
}
