/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/topup_virtual_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'topup_virtual_send.g.dart';

/// JSON conversion for 'topup_virtual_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TopupVirtualRequest extends Request {
  /// Initialize TopupVirtualRequest
  const TopupVirtualRequest({
    this.topupVirtual = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'topup_virtual',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory TopupVirtualRequest.fromJson(Map<String, dynamic> json) =>
      _$TopupVirtualRequestFromJson(json);

  /// Must be `1`
  final int topupVirtual;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TopupVirtualRequestToJson(this);

  /// Creates a copy of instance with given parameters
  @override
  TopupVirtualRequest copyWith({
    int topupVirtual,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      TopupVirtualRequest(
        topupVirtual: topupVirtual ?? this.topupVirtual,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
