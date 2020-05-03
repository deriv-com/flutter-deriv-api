import 'package:flutter_deriv_api/api/models/new_account_base_model.dart';

/// New account real model class
abstract class NewAccountRealModel extends NewAccountBaseModel {
  /// Initializes
  NewAccountRealModel({
    String clientId,
    this.landingCompany,
    this.landingCompanyShort,
    String oauthToken,
  }) : super(
          clientId: clientId,
          oauthToken: oauthToken,
        );

  /// Landing company full name
  final String landingCompany;

  /// Landing company short code
  final String landingCompanyShort;
}
