/// Either response of API for call with two possible responses
/// Either of [L] or [R] will be not-null
class EitherResponse<L, R> {
  /// Initializes
  EitherResponse(this._left, this._right);

  final L _left;

  final R _right;

  /// Left
  L get left => _left;

  /// Right
  R get right => _right;

  /// Result contains the [left] value
  bool isLeft() => _left != null;

  /// Result contains the [right] value
  bool isRight() => _right != null;
}
