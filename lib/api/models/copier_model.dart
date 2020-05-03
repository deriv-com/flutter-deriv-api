import 'api_base_model.dart';

/// Copier mode class
class CopierModel extends APIBaseModel {
  /// Initializes
  CopierModel({this.loginId});

  /// Creates instance from JSON
  factory CopierModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CopierModel(
        loginId: json['loginid'],
      );

  /// The loginId of the copier's account.
  final String loginId;

  /// Clones a new instance
  CopierModel copyWith({
    String loginId,
  }) =>
      CopierModel(
        loginId: loginId ?? this.loginId,
      );
}
