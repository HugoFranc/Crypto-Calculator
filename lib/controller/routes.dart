
import 'package:crypto_app/controller/load_page_info.dart';
import 'package:crypto_app/ui/Exchange_screen/exchange_screen.dart';
import 'package:crypto_app/ui/live_screen.dart';
import 'package:crypto_app/ui/main_screen.dart';
import 'package:crypto_app/ui/settings_screen.dart';
import 'package:flutter/material.dart';


class NavigationRoutes extends StatefulWidget {
  final int index;

  const NavigationRoutes({Key? key, required this.index}) : super(key: key);

  @override
  State<NavigationRoutes> createState() => _NavigationRoutesState();
}

class _NavigationRoutesState extends State<NavigationRoutes> {

  List<Widget> screens = [
    HomePage(apiRequest: LoadPage.getApiRequestMode), 
    ExchangeScreen(),
    LiveScreen(),
    SettingsScreen()
    ];

  @override
  Widget build(BuildContext context) {
    return screens[widget.index];
  }
}
