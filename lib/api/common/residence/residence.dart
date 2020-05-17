import 'package:flutter_deriv_api/api/common/models/residence_model.dart';
import 'package:flutter_deriv_api/api/common/residence/exceptions/residence_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Country with account opening
class Residence extends ResidenceModel {
  /// Initializes
  Residence({
    String phoneIdd,
    String countryName,
    String countryCode,
  }) : super(
          phoneIdd: phoneIdd,
          countryName: countryName,
          countryCode: countryCode,
        );

  /// Generates an instance from JSON
  factory Residence.fromJson(
    Map<String, dynamic> json,
  ) =>
      Residence(
        phoneIdd: json['phone_idd'],
        countryName: json['text'],
        countryCode: json['value'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets Residence list for the given [ResidenceListRequest]
  static Future<List<Residence>> fetchResidenceList(
    ResidenceListRequest request,
  ) async {
    final ResidenceListResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          ResidenceException(message: message),
    );

    return getListFromMap(
      response.residenceList,
      itemToTypeCallback: (dynamic item) => Residence.fromJson(item),
    );
  }

  /// Generates a copy of instance with given parameters
  Residence copyWith({
    String phoneIdd,
    String countryName,
    String countryCode,
  }) =>
      Residence(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
      );
}
