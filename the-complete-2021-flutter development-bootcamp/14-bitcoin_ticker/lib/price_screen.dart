import 'dart:io';
import 'package:bitcoin_ticker/coin_api.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<Padding> cryptoCurrenciesList = [];
  CoinApi coinApi = CoinApi();

  @override
  void initState() {
    super.initState();
    generateCryptoWidgetList().then((widgetList) {
      setState(() {
        cryptoCurrenciesList = widgetList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ...cryptoCurrenciesList,
                ],
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getCurrencyPicker(),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getCurrencyDropdownItemList(
      List<String> currencies) {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (var currency in currencies) {
      dropdownItems.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }

    return dropdownItems;
  }

  List<Text> getCurrencyCupertinoPickerItemList(List<String> currencies) {
    List<Text> dropdownItems = [];

    for (var currency in currencies) {
      dropdownItems.add(
        Text(currency),
      );
    }

    return dropdownItems;
  }

  Widget getCurrencyPicker() {
    return Platform.isAndroid
        ? DropdownButton<String>(
            value: selectedCurrency,
            items: getCurrencyDropdownItemList(currenciesList),
            onChanged: (value) async {
              selectedCurrency = value as String;
              cryptoCurrenciesList = await generateCryptoWidgetList();
              setState(() {});
            },
          )
        : CupertinoPicker(
            children: getCurrencyCupertinoPickerItemList(currenciesList),
            itemExtent: 32.0,
            onSelectedItemChanged: (selectedIndex) async {
              selectedCurrency = currenciesList[selectedIndex];
              cryptoCurrenciesList = await generateCryptoWidgetList();
              setState(() {});
            },
            scrollController: FixedExtentScrollController(
              initialItem: 19, // USD
            ));
  }

  Future<List<Padding>> generateCryptoWidgetList() async {
    List<Padding> widgetList = [];

    var coins = await getCoins();

    for (var coin in coins) {
      widgetList.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${coin.cryptoCode} = ${coin.exchangeRate} ${coin.currencyCode}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return widgetList;
  }

  Future<List<CoinData>> getCoins() async {
    return await coinApi.getExchangeData(selectedCurrency);
  }
}
