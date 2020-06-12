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
    List<String> tinFormat,
    String disabled,
    String selected,
  }) : super(
          phoneIdd: phoneIdd,
          countryName: countryName,
          countryCode: countryCode,
          tinFormat: tinFormat,
          disabled: disabled,
          selected: selected,
        );

  /// Generates an instance from JSON
  factory Residence.fromJson(
    Map<String, dynamic> json,
  ) =>
      Residence(
        phoneIdd: json['phone_idd'],
        countryName: json['text'],
        countryCode: json['value'],
        tinFormat: getListFromMap(json['tin_format']),
        disabled: json['disabled'],
        selected: json['selected'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// 'true' if disabled
  bool get isDisabled => disabled?.toLowerCase() == 'disabled';

  /// 'true' if selected
  bool get isSelected => selected?.toLowerCase() == 'selected';

  /// Gets Residence list for the given [ResidenceListRequest]
  ///
  /// Throws a [ResidenceException] if API response contains an error
  static Future<List<Residence>> fetchResidenceList([
    ResidenceListRequest request,
  ]) async {
    final ResidenceListResponse response = await _api.call(
      request: request ?? const ResidenceListRequest(),
    );

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
    List<String> tinFormat,
    String disabled,
    String selected,
  }) =>
      Residence(
        phoneIdd: phoneIdd ?? this.phoneIdd,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        tinFormat: tinFormat ?? this.tinFormat,
        disabled: disabled ?? this.disabled,
        selected: selected ?? this.selected,
      );
}
