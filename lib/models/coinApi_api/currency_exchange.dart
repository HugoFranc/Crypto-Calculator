

import 'package:crypto_app/controller/load_exchange_info.dart';

class CurrencyExchange {
  static List<String> getCurrencyList(dynamic information) {
    var currencyList = <String>['Currency'];

    information.forEach((key, value) {
      if (!currencyList.contains(key)) {
        currencyList.add(key);
      }
    });

    return currencyList;
  }

  double convertCurrencies( String firstCurrency, String secondCurrency, int amount, LoadExchange exchangeInfo) {
    



    var allExchanges = exchangeInfo.getMapExchanges;

    double firstCurrencyToUSD = 0;
    double secondCurrencyToUSD = 0;

    double usdValueForCurrencyOne = 0;
    double usdExchanged = 0;

    allExchanges.forEach((key, value) {
      if (key == firstCurrency) {
        firstCurrencyToUSD = value;
      }

      if (key == secondCurrency) {
        secondCurrencyToUSD = value;
      }
    });

    // QUIERO CAMBIAR 5 DE ETH A BTC
    // TENGO QUE UNA MONEDA DE ETH = 0.3USD
    // TENGO QUE UNA MONEDA DE BTC = 0.7USD

    // PASAR TODO LO QUE TENGO DE ETH A DOLLAR POR ENDE
    // 5 ETH * VALOR USD

    usdValueForCurrencyOne = amount * firstCurrencyToUSD;

    // ESTO DEBERIA DE DARME 1.5 USD
    // POR CADA DOLLAR QUE TENGO GENERADO A TRAVES DEL TOTAL DEPENDIENDO DEL VALOR
    // DE LA SEGUNDA MONEDA, LO VOY A DIVIDIR
    // 1.5 / VALOR DE MONDE DE BTC (0.7)

    usdExchanged = (usdValueForCurrencyOne / secondCurrencyToUSD);

    return usdExchanged;

  }
}
