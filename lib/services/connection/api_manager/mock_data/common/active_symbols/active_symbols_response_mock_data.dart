/// Active symbol response
const String activeSymbolsResponse = '''
{
  "active_symbols": [
    {
      "allow_forward_starting": 0,
      "delay_amount": 0,
      "display_name": "AUD Index",
      "exchange_is_open": 1,
      "exchange_name": "FOREX",
      "intraday_interval_minutes": 5,
      "is_trading_suspended": 0,
      "market": "forex",
      "market_display_name": "Forex",
      "pip": 0.001,
      "quoted_currency_symbol": "WLDAUD",
      "spot": 808.243,
      "spot_age": "1",
      "spot_time": "1586926361",
      "submarket": "smart_fx",
      "submarket_display_name": "Smart FX",
      "symbol": "WLDAUD",
      "symbol_type": "smart_fx"
    }
  ],
  "echo_req": {
    "active_symbols": "full",
    "product_type": "basic"
  },
  "msg_type": "active_symbols"
}
''';
