// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_chat_create_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_chat_create_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p chat create response model class.
abstract class P2pChatCreateResponseModel {
  /// Initializes P2p chat create response model class .
  const P2pChatCreateResponseModel({
    this.p2pChatCreate,
  });

  /// Information of the P2P chat.
  final P2pChatCreate? p2pChatCreate;
}

/// P2p chat create response class.
class P2pChatCreateResponse extends P2pChatCreateResponseModel {
  /// Initializes P2p chat create response class.
  const P2pChatCreateResponse({
    P2pChatCreate? p2pChatCreate,
  }) : super(
          p2pChatCreate: p2pChatCreate,
        );

  /// Creates an instance from JSON.
  factory P2pChatCreateResponse.fromJson(
    dynamic p2pChatCreateJson,
  ) =>
      P2pChatCreateResponse(
        p2pChatCreate: p2pChatCreateJson == null
            ? null
            : P2pChatCreate.fromJson(p2pChatCreateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pChatCreate != null) {
      resultMap['p2p_chat_create'] = p2pChatCreate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a P2P (peer to peer) chat for the specified order.
  ///
  /// For parameters information refer to [P2pChatCreateRequest].
  /// Throws a [P2PException] if API response contains an error
  static Future<P2pChatCreateResponse> createChat(
    P2pChatCreateRequest request,
  ) async {
    final P2pChatCreateReceive response = await createChatRaw(request);

    return P2pChatCreateResponse.fromJson(response.p2pChatCreate);
  }

  /// Creates a P2P (peer to peer) chat for the specified order.
  ///
  /// For parameters information refer to [P2pChatCreateRequest].
  /// Throws a [P2PException] if API response contains an error
  static Future<P2pChatCreateReceive> createChatRaw(
    P2pChatCreateRequest request,
  ) async {
    final P2pChatCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PChatException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pChatCreateResponse copyWith({
    P2pChatCreate? p2pChatCreate,
  }) =>
      P2pChatCreateResponse(
        p2pChatCreate: p2pChatCreate ?? this.p2pChatCreate,
      );
}
/// P2p chat create model class.
abstract class P2pChatCreateModel {
  /// Initializes P2p chat create model class .
  const P2pChatCreateModel({
    required this.orderId,
    required this.channelUrl,
  });

  /// The unique identifier for the order that the chat belongs to.
  final String orderId;

  /// The URL to be used to initialise the chat for the requested order.
  final String channelUrl;
}

/// P2p chat create class.
class P2pChatCreate extends P2pChatCreateModel {
  /// Initializes P2p chat create class.
  const P2pChatCreate({
    required String channelUrl,
    required String orderId,
  }) : super(
          channelUrl: channelUrl,
          orderId: orderId,
        );

  /// Creates an instance from JSON.
  factory P2pChatCreate.fromJson(Map<String, dynamic> json) => P2pChatCreate(
        channelUrl: json['channel_url'],
        orderId: json['order_id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['channel_url'] = channelUrl;
    resultMap['order_id'] = orderId;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pChatCreate copyWith({
    String? channelUrl,
    String? orderId,
  }) =>
      P2pChatCreate(
        channelUrl: channelUrl ?? this.channelUrl,
        orderId: orderId ?? this.orderId,
      );
}
