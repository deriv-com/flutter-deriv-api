import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

/// super class of all requests
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class Response extends Equatable {
  /// Initializes
  const Response({
    this.echoReq,
    this.error,
    this.msgType,
    this.reqId,
  });

  /// Creates instance from JSON
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// Echo of the request made.
  final Map<String, dynamic> echoReq;

  /// Error
  final Map<String, dynamic> error;

  /// Action name of the request made.
  final String msgType;

  /// [Optional] Used to map request to response.
  final int reqId;

  /// Converts to JSON
  Map<String, dynamic> toJson() => _$ResponseToJson(this);

  /// Creates copy of instance with given parameters
  Response copyWith({
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      Response(
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
