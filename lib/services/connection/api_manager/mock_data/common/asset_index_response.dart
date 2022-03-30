/// Asset index response
const String assetIndexResponse = '''{
  "asset_index": [
    [
      "frxAUDJPY",
      "AUD/JPY",
      [
        [
          "callput",
          "Rise/Fall",
          "5t",
          "365d"
        ],
        [
          "callputequal",
          "Rise/Fall Equal",
          "3m",
          "365d"
        ],
        [
          "callput",
          "Higher/Lower",
          "1d",
          "365d"
        ],
        [
          "touchnotouch",
          "Touch/No Touch",
          "1d",
          "365d"
        ],
        [
          "endsinout",
          "Ends Between/Ends Outside",
          "1d",
          "365d"
        ],
        [
          "staysinout",
          "Stays Between/Goes Outside",
          "1d",
          "365d"
        ]
      ]
    ]
  ],
  "echo_req": {
    "asset_index": 1
  },
  "msg_type": "asset_index"
}''';