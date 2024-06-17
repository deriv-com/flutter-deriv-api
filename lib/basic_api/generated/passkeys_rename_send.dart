/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/passkeys_rename_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Passkeys rename request class.
class PasskeysRenameRequest extends Request {
  /// Initialize PasskeysRenameRequest.
  const PasskeysRenameRequest({
    required this.id,
    this.loginid,
    required this.name,
    this.passkeysRename = true,
    super.msgType = 'passkeys_rename',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory PasskeysRenameRequest.fromJson(Map<String, dynamic> json) =>
      PasskeysRenameRequest(
        id: json['id'] as int?,
        loginid: json['loginid'] as String?,
        name: json['name'] as String?,
        passkeysRename: json['passkeys_rename'] == null
            ? null
            : json['passkeys_rename'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// The id of the passkey to rename.
  final int? id;

  /// [Optional] The login id of the user. If left unspecified, it defaults to the initial authorized token's login id.
  final String? loginid;

  /// The new name of the passkey.
  final String? name;

  /// Must be `true`
  final bool? passkeysRename;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'loginid': loginid,
        'name': name,
        'passkeys_rename': passkeysRename == null
            ? null
            : passkeysRename!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PasskeysRenameRequest copyWith({
    int? id,
    String? loginid,
    String? name,
    bool? passkeysRename,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      PasskeysRenameRequest(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        passkeysRename: passkeysRename ?? this.passkeysRename,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
