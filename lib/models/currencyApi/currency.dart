// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class Currency{

   
  String symbol;
  String name;
  String name_full;
  dynamic max_supply;
  String icon_url;

  Currency(this.symbol, this.name ,this.name_full, this.max_supply, this.icon_url);

  static List formatSupply(List listOfCurrencies){

    var formatter = NumberFormat('#,###,000');

    for (var element in listOfCurrencies) {
      
      if(element.max_supply is !String) {
        element.max_supply = formatter.format(element.max_supply);
      }
    }
    return listOfCurrencies;
  }

  static List parseMap(dynamic information) {
    var currencyList = [];

    information.forEach((key, value) {
      currencyList.add(Currency(value["symbol"], value["name"],
          value["name_full"], value["max_supply"], value["icon_url"]));
    });

    return currencyList;
  }

}