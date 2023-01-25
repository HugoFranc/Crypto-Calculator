import 'package:crypto_app/models/currencyApi/currency.dart';

class LoadPage {
  dynamic information;
  static bool apiRequest = false;

  var listLog = [];

  dynamic get getInformation {
    return information;
  }

  static bool get getApiRequestMode {
    return apiRequest;
  }

  dynamic get getListLogs {
    return listLog;
  }

  set setListLogs(dynamic information) {
    listLog = Currency.parseMap(information);
    listLog = Currency.formatSupply(listLog);
  }

  set setApiRequestMode(bool requested) {
    apiRequest = requested;
  }

  set setInformation(dynamic apiResponse) {
    information = apiResponse;
  }
}
