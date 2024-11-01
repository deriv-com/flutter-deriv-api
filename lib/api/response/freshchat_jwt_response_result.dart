// ignore_for_file: prefer_single_quotes

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/freshchat_user_jwt_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/service_token_receive.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Freshworks User JWT response model class.
abstract class FreshChatJwtResponseModel {
  /// Initializes FreshChat JWT response model class.
  const FreshChatJwtResponseModel({
    this.freshworksUserJwt,
  });

  /// The Freshworks User JWT.
  final FreshworksUserJwt? freshworksUserJwt;
}

/// Freshworks User JWT.
class FreshworksUserJwt {
  /// Initializes Freshworks User JWT.
  const FreshworksUserJwt({
    required this.token,
  });

  /// Creates an instance from JSON.
  factory FreshworksUserJwt.fromJson(Map<String, dynamic> json) =>
      FreshworksUserJwt(
        token: json['token'],
      );

  /// The token itself.
  final String token;

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() => <String, String>{
        'token': token,
      };
}

/// Freshworks User JWT response class.
class FreshChatJwtResponse extends FreshChatJwtResponseModel {
  /// Initializes FreshChat JWT response class.
  const FreshChatJwtResponse({
    required FreshworksUserJwt freshworksUserJwt,
  }) : super(freshworksUserJwt: freshworksUserJwt);

  /// Creates an instance from JSON.
  factory FreshChatJwtResponse.fromJson(Map<String, dynamic> json) =>
      FreshChatJwtResponse(
        freshworksUserJwt:
            FreshworksUserJwt.fromJson(json['freshworks_user_jwt']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'service_token': <String, Map<String, dynamic>?>{
          'freshworks_user_jwt': freshworksUserJwt?.toJson(),
        },
      };

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Calls the Freshworks JWT service.
  ///
  /// Throws a [BaseAPIException] if the API response contains an error.
  static Future<FreshChatJwtResponse> fetchFreshworksJwt(
    FreshworksUserJwtRequest
        request, // Replace with your actual request type if available
  ) async {
    final ServiceTokenReceive response = await _api.call(
        request:
            request); // You may need to adjust this line based on your actual API call

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return FreshChatJwtResponse.fromJson(
        response.serviceToken!); // Adjust based on your API response
  }

  /// Creates a copy of instance with given parameters.
  FreshChatJwtResponse copyWith({
    FreshworksUserJwt? freshworksUserJwt,
  }) =>
      FreshChatJwtResponse(
        freshworksUserJwt: freshworksUserJwt ?? this.freshworksUserJwt!,
      );
}
