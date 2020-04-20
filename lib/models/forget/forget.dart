/// Forget model class
abstract class ForgetModel {
  /// Class constructor
  ForgetModel({
    this.forget,
  });

  /// If set to true, stream exited and stopped. If set to false, stream did not exist.
  final bool forget;
}
