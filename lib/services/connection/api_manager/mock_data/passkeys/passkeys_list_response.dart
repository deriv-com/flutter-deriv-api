/// Wallet migration response mock data.
const String passkeysListResponse = '''{
    "echo_req": {
        "passkeys_list": 1
    },
    "msg_type": "passkeys_list",
    "passkeys_list": [
        {
            "created_at": 10000,
            "id": "id",
            "last_used": 10000,
            "name": "Passkey",
            "passkey_id": "passkeyId",
            "stored_on": "storedOn"
        }
    ]
}''';
