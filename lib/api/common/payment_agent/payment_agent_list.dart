import 'package:flutter_deriv_api/api/common/models/country_model.dart';
import 'package:flutter_deriv_api/api/common/models/payment_agent_list_model.dart';
import 'package:flutter_deriv_api/api/common/models/payment_agent_model.dart';
import 'package:flutter_deriv_api/api/common/payment_agent/exceptions/payment_agent_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Payment agent list class
class PaymentAgentList extends PaymentAgentListModel {
  /// Initializes
  PaymentAgentList({
    List<CountryModel> countries,
    List<PaymentAgentModel> paymentAgents,
  }) : super(
          countries: countries,
          paymentAgents: paymentAgents,
        );

  /// Generates an instance from response
  factory PaymentAgentList.fromResponse(PaymentagentListResponse response) =>
      PaymentAgentList(
        countries: response.paymentagentList['available_countries']
            .map<CountryModel>((dynamic item) => CountryModel.fromItem(item))
            .toList(),
        paymentAgents: getListFromMap(
          response.paymentagentList['list'],
          itemToTypeCallback: (dynamic item) =>
              PaymentAgentModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
  PaymentAgentList copyWith({
    List<CountryModel> countries,
    List<PaymentAgentModel> paymentAgents,
  }) =>
      PaymentAgentList(
        countries: countries ?? this.countries,
        paymentAgents: paymentAgents ?? this.paymentAgents,
      );

  /// Returns a list of Payment Agents for a given country for a given currency.
  ///
  /// For parameters information refer to [PaymentagentListRequest].
  /// Throws a [PaymentAgentException] if API response contains an error
  static Future<PaymentAgentList> fetch(
    PaymentagentListRequest request,
  ) async {
    final PaymentagentListResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          PaymentAgentException(baseExceptionModel: baseExceptionModel),
    );

    return PaymentAgentList.fromResponse(response);
  }
}
