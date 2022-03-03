import 'dart:convert';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:http/http.dart' as http;

// https://min-api.cryptocompare.com/documentation
const apiUrl = "https://min-api.cryptocompare.com/data/pricemulti";
const apiKey = "your-api-key";

class CoinApi {
  Future<List<CoinData>> getExchangeData(String currencyCode) async {
    List<CoinData> coins = [];
    var cryptoCurrenciesJoined = cryptoList.join(',');

    var url =
        Uri.parse("$apiUrl?fsyms=$cryptoCurrenciesJoined&tsyms=$currencyCode");

    var response = await http.get(url, headers: {
      "authorization": "Apikey $apiKey",
    });

    if (response.statusCode != 200) {
      return coins;
    }

    var x = jsonDecode(response.body) as Map;

    for (var entry in x.entries) {
      CoinData coin = CoinData(
        cryptoCode: entry.key as String,
        currencyCode: currencyCode,
        exchangeRate:
            double.parse((entry.value as Map).entries.first.value.toString()),
      );

      coins.add(coin);
    }

    return coins;
  }
}
