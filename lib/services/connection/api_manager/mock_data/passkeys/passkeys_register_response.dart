/// Wallet migration response mock data.
const String passkeysRegisterResponse = '''{
    "echo_req": {
        "passkeys_register": 1
    },
    "msg_type": "passkeys_register",
    "passkeys_register": {
        "properties": {
          "created_at": 10000,
          "id": "id",
          "last_used": 10000,
          "name": "Passkey",
          "passkey_id": "passkeyId",
          "stored_on": "storedOn"
        }
    }
}''';
