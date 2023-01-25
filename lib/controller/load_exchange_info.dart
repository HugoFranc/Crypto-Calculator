
import 'package:crypto_app/models/coinApi_api/currency_exchange.dart';

class LoadExchange {
  String currencyOne = '';

  String currencyTwo = '';

  int amount = 0;

  bool validExchange = false;

  List<String> symbols = [];

  dynamic mapExchanges;


  dynamic get getMapExchanges{
    return mapExchanges;
  }

  List<String> get getSymbols {
    return symbols;
  }

  String get getCurrencyOne {
    return currencyOne;
  }

  String get getCurrencyTwo {
    return currencyTwo;
  }

  int get getAmount {
    return amount;
  }

  bool get getValidExchange {
    return currencyOne.isNotEmpty && currencyTwo.isNotEmpty && amount > 0
        ? !validExchange
        : validExchange;
  }

  set setCurrencyOne(String currencyChosen) {
    currencyOne = currencyChosen;
  }

  set setCurrencyTwo(String currencyChosen) {
    currencyTwo = currencyChosen;
  }

  set setSymbols(dynamic info) {
    symbols = CurrencyExchange.getCurrencyList(info);
  }

  set setAmount(String number) {
    if (number.isNotEmpty) {
      amount = int.parse(number);
    } else {
      amount = 0;
    }
  }

  set setExchanges(dynamic info){
    mapExchanges = info;
  }
}
