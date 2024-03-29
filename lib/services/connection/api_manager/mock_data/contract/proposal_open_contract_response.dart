/// Proposal open contract response
const String proposalOpenContractResponse = '''
{
  "echo_req": {
    "contract_id": 79944933588,
    "proposal_open_contract": 1
  },
  "msg_type": "proposal_open_contract",
  "proposal_open_contract": {
    "audit_details": {
      "contract_end": [
        {
          "epoch": 1587533976,
          "tick": 1419.96,
          "tick_display_value": "1419.96"
        },
        {
          "epoch": 1587533978,
          "tick": 1419.62,
          "tick_display_value": "1419.62"
        },
        {
          "epoch": 1587533980,
          "flag": "highlight_tick",
          "name": "End Time and Exit Spot",
          "tick": 1419.53,
          "tick_display_value": "1419.53"
        }
      ],
      "contract_start": [
        {
          "epoch": 1587533916,
          "tick": 1417.06,
          "tick_display_value": "1417.06"
        },
        {
          "epoch": 1587533918,
          "tick": 1417.67,
          "tick_display_value": "1417.67"
        },
        {
          "epoch": 1587533920,
          "flag": "highlight_time",
          "name": "Start Time",
          "tick": 1417.72,
          "tick_display_value": "1417.72"
        },
        {
          "epoch": 1587533922,
          "flag": "highlight_tick",
          "name": "Entry Spot",
          "tick": 1417.65,
          "tick_display_value": "1417.65"
        },
        {
          "epoch": 1587533924,
          "tick": 1417.29,
          "tick_display_value": "1417.29"
        },
        {
          "epoch": 1587533926,
          "tick": 1417.41,
          "tick_display_value": "1417.41"
        }
      ]
    },
    "barrier": "1417.75",
    "barrier_count": 1,
    "bid_price": 50,
    "buy_price": 24.55,
    "contract_id": 79944933588,
    "contract_type": "MULTDOWN",
    "currency": "USD",
    "current_spot": 1419.53,
    "current_spot_display_value": "1419.53",
    "current_spot_time": 1587533980,
    "date_expiry": 1587533980,
    "date_settlement": 1587533980,
    "date_start": 1587533920,
    "display_name": "USD/JPY",
    "entry_spot": 1417.65,
    "entry_spot_display_value": "1417.65",
    "entry_tick": 1417.65,
    "entry_tick_display_value": "1417.65",
    "entry_tick_time": 1587533922,
    "exit_tick": 1419.53,
    "exit_tick_display_value": "1419.53",
    "exit_tick_time": 1587533980,
    "expiry_time": 1587533980,
    "is_expired": 1,
    "is_forward_starting": 0,
    "is_intraday": 1,
    "is_path_dependent": 0,
    "is_settleable": 1,
    "is_sold": 0,
    "is_valid_to_cancel": 0,
    "is_valid_to_sell": 1,
    "longcode": "Win 50% of your stake for every 1% fall in USD/JPY.",
    "payout": 50,
    "profit": 25.45,
    "profit_percentage": 103.67,
    "purchase_time": 1587533920,
    "shortcode": "MULTDOWN_FRXUSDJPY_7_50_1603975474_4757575474_60m_0.00",
    "status": "open",
    "multiplier": 100.0,
    "transaction_ids": {
      "buy": 159790493028
    },
    "underlying": "frxUSDJPY"
  },
  "subscription": {
    "id": "042922fe-5664-09e4-c3bf-b3bbcf8f31db"
  }
}
''';
