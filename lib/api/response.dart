import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

/// super class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Response extends Equatable {
  /// Initializes
  const Response({
    this.reqId,
    this.msgType,
    this.echoReq,
    this.error,
  });

  /// Creates instance from JSON
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// [Optional] Used to map request to response.
  final int reqId;

  /// Action name of the request made.
  final String msgType;

  /// Echo of the request made.
  final Map<String, dynamic> echoReq;

  /// Error
  final Map<String, dynamic> error;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  /// Creates copy of instance with given parameters
  Response copyWith({
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      Response(
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
