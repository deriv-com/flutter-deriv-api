import 'package:flutter_deriv_api/api/app/models/new_account_base_model.dart';

/// New account real model class
abstract class NewAccountRealModel extends NewAccountBaseModel {
  /// Initializes
  NewAccountRealModel({
    String? clientId,
    this.landingCompany,
    this.landingCompanyShort,
    String? oauthToken,
    String? refreshToken,
  }) : super(
          clientId: clientId,
          oauthToken: oauthToken,
          refreshToken: refreshToken,
        );

  /// Landing company full name
  final String? landingCompany;

  /// Landing company short code
  final String? landingCompanyShort;
}
