// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Kyc auth status response model class.
abstract class KycAuthStatusResponseModel {
  /// Initializes Kyc auth status response model class .
  const KycAuthStatusResponseModel({
    this.kycAuthStatus,
  });

  /// Proof of Identity (POI) and Proof of Address (POA) authentication status details.
  final KycAuthStatus? kycAuthStatus;
}

/// Kyc auth status response class.
class KycAuthStatusResponse extends KycAuthStatusResponseModel {
  /// Initializes Kyc auth status response class.
  const KycAuthStatusResponse({
    super.kycAuthStatus,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatusResponse.fromJson(
    dynamic kycAuthStatusJson,
  ) =>
      KycAuthStatusResponse(
        kycAuthStatus: kycAuthStatusJson == null
            ? null
            : KycAuthStatus.fromJson(kycAuthStatusJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (kycAuthStatus != null) {
      resultMap['kyc_auth_status'] = kycAuthStatus!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  KycAuthStatusResponse copyWith({
    KycAuthStatus? kycAuthStatus,
  }) =>
      KycAuthStatusResponse(
        kycAuthStatus: kycAuthStatus ?? this.kycAuthStatus,
      );
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "none": StatusEnum.none,
  "pending": StatusEnum.pending,
  "rejected": StatusEnum.rejected,
  "verified": StatusEnum.verified,
  "expired": StatusEnum.expired,
};

/// Status Enum.
enum StatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// rejected.
  rejected,

  /// verified.
  verified,

  /// expired.
  expired,
}

/// ServiceEnum mapper.
final Map<String, ServiceEnum> serviceEnumMapper = <String, ServiceEnum>{
  "none": ServiceEnum.none,
  "idv": ServiceEnum.idv,
  "onfido": ServiceEnum.onfido,
  "manual": ServiceEnum.manual,
};

/// Service Enum.
enum ServiceEnum {
  /// none.
  none,

  /// idv.
  idv,

  /// onfido.
  onfido,

  /// manual.
  manual,
}

/// IdentityStatusEnum mapper.
final Map<String, IdentityStatusEnum> identityStatusEnumMapper =
    <String, IdentityStatusEnum>{
  "none": IdentityStatusEnum.none,
  "pending": IdentityStatusEnum.pending,
  "rejected": IdentityStatusEnum.rejected,
  "verified": IdentityStatusEnum.verified,
  "expired": IdentityStatusEnum.expired,
  "suspected": IdentityStatusEnum.suspected,
};

/// Status Enum.
enum IdentityStatusEnum {
  /// none.
  none,

  /// pending.
  pending,

  /// rejected.
  rejected,

  /// verified.
  verified,

  /// expired.
  expired,

  /// suspected.
  suspected,
}
/// Kyc auth status model class.
abstract class KycAuthStatusModel {
  /// Initializes Kyc auth status model class .
  const KycAuthStatusModel({
    required this.identity,
    required this.address,
  });

  /// POI authentication status details.
  final Identity identity;

  /// POA authentication status details.
  final Address address;
}

/// Kyc auth status class.
class KycAuthStatus extends KycAuthStatusModel {
  /// Initializes Kyc auth status class.
  const KycAuthStatus({
    required super.address,
    required super.identity,
  });

  /// Creates an instance from JSON.
  factory KycAuthStatus.fromJson(Map<String, dynamic> json) => KycAuthStatus(
        address: Address.fromJson(json['address']),
        identity: Identity.fromJson(json['identity']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address'] = address.toJson();

    resultMap['identity'] = identity.toJson();

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  KycAuthStatus copyWith({
    Address? address,
    Identity? identity,
  }) =>
      KycAuthStatus(
        address: address ?? this.address,
        identity: identity ?? this.identity,
      );
}
/// Address model class.
abstract class AddressModel {
  /// Initializes Address model class .
  const AddressModel({
    this.status,
  });

  /// Current POA status.
  final StatusEnum? status;
}

/// Address class.
class Address extends AddressModel {
  /// Initializes Address class.
  const Address({
    super.status,
  });

  /// Creates an instance from JSON.
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        status:
            json['status'] == null ? null : statusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Address copyWith({
    StatusEnum? status,
  }) =>
      Address(
        status: status ?? this.status,
      );
}
/// Identity model class.
abstract class IdentityModel {
  /// Initializes Identity model class .
  const IdentityModel({
    this.availableServices,
    this.lastRejected,
    this.service,
    this.status,
  });

  /// Available services for the next POI attempt.
  final List<String>? availableServices;

  /// Details on the rejected POI attempt.
  final LastRejected? lastRejected;

  /// Service used for the current POI status.
  final ServiceEnum? service;

  /// Current POI status.
  final IdentityStatusEnum? status;
}

/// Identity class.
class Identity extends IdentityModel {
  /// Initializes Identity class.
  const Identity({
    super.availableServices,
    super.lastRejected,
    super.service,
    super.status,
  });

  /// Creates an instance from JSON.
  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
        availableServices: json['available_services'] == null
            ? null
            : List<String>.from(
                json['available_services']?.map(
                  (dynamic item) => item,
                ),
              ),
        lastRejected: json['last_rejected'] == null
            ? null
            : LastRejected.fromJson(json['last_rejected']),
        service:
            json['service'] == null ? null : serviceEnumMapper[json['service']],
        status: json['status'] == null
            ? null
            : identityStatusEnumMapper[json['status']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (availableServices != null) {
      resultMap['available_services'] = availableServices!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (lastRejected != null) {
      resultMap['last_rejected'] = lastRejected!.toJson();
    }
    resultMap['service'] = serviceEnumMapper.entries
        .firstWhere(
            (MapEntry<String, ServiceEnum> entry) => entry.value == service)
        .key;
    resultMap['status'] = identityStatusEnumMapper.entries
        .firstWhere((MapEntry<String, IdentityStatusEnum> entry) =>
            entry.value == status)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Identity copyWith({
    List<String>? availableServices,
    LastRejected? lastRejected,
    ServiceEnum? service,
    IdentityStatusEnum? status,
  }) =>
      Identity(
        availableServices: availableServices ?? this.availableServices,
        lastRejected: lastRejected ?? this.lastRejected,
        service: service ?? this.service,
        status: status ?? this.status,
      );
}
/// Last rejected model class.
abstract class LastRejectedModel {
  /// Initializes Last rejected model class .
  const LastRejectedModel({
    this.documentType,
    this.rejectedReasons,
  });

  /// Document type of the rejected POI attempt (IDV only).
  final String? documentType;

  /// Reason(s) for the rejected POI attempt.
  final List<String>? rejectedReasons;
}

/// Last rejected class.
class LastRejected extends LastRejectedModel {
  /// Initializes Last rejected class.
  const LastRejected({
    super.documentType,
    super.rejectedReasons,
  });

  /// Creates an instance from JSON.
  factory LastRejected.fromJson(Map<String, dynamic> json) => LastRejected(
        documentType: json['document_type'],
        rejectedReasons: json['rejected_reasons'] == null
            ? null
            : List<String>.from(
                json['rejected_reasons']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['document_type'] = documentType;
    if (rejectedReasons != null) {
      resultMap['rejected_reasons'] = rejectedReasons!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LastRejected copyWith({
    String? documentType,
    List<String>? rejectedReasons,
  }) =>
      LastRejected(
        documentType: documentType ?? this.documentType,
        rejectedReasons: rejectedReasons ?? this.rejectedReasons,
      );
}
