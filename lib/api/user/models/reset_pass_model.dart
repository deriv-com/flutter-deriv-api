/// Reset password model class
abstract class ResetPasswordModel {
  /// Initializes
  ResetPasswordModel({
    required this.resetPassword,
  });

  /// `true`: password reset success, `false`: password reset failure
  final bool resetPassword;
}