import 'base_model.dart';

/// Copier
class CopierModel extends BaseModel{
  /// Constructor
  CopierModel({this.loginid});

  /// Instance from JSON
  factory CopierModel.fromJson(Map<String, dynamic> json) => CopierModel(
    loginid: json['loginid'],
  );

  /// The loginid of the copier's account.
  final String loginid;

  /// ToJson
  CopierModel copyWith({
    String loginid,
  }) =>
      CopierModel(loginid: loginid ?? this.loginid);
}