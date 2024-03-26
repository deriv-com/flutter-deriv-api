/// Wallet migration response mock data.
const String passkeysRegisterOptionsResponse = '''{
    "echo_req": {
        "passkeys_register_options": 1
    },
    "msg_type": "passkeys_register_options",
    "passkeys_register_options": {
        "publicKey": {
            "attestation": "direct",
            "authenticatorSelection": {
                "requireResidentKey": true,
                "residentKey": "required",
                "userVerification": "preferred"
            },
            "challenge": "40gAmfy2FaUGwsV_VrxtvBgPa77dl8W6fFLxQf5WHMc",
            "excludeCredentials": [],
            "extensions": {
                "credProps": true
            },
            "pubKeyCredParams": [
                {
                    "alg": -8,
                    "type": "public-key"
                },
                {
                    "alg": -7,
                    "type": "public-key"
                },
                {
                    "alg": -257,
                    "type": "public-key"
                }
            ],
            "rp": {
                "id": "deriv.com",
                "name": "Deriv"
            },
            "timeout": 60000,
            "user": {
                "displayName": "bassam@deriv.com",
                "id": 14,
                "name": "bassam@deriv.com"
            }
        }
    }
}''';
