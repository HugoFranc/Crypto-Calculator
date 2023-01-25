
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PersonalBottomNavigationBar extends StatefulWidget {
  final Function currentIndex;
  const PersonalBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<PersonalBottomNavigationBar> createState() =>
      _PersonalBottomNavigationBarState();
}

class _PersonalBottomNavigationBarState
    extends State<PersonalBottomNavigationBar> {
  int actualPage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFF242934),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.8),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.currency_exchange,
                text: 'Exchange',
              ),
              const GButton(
                icon: Icons.web_asset,
                text: 'WebSocket',
              ),
              const GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
            selectedIndex: actualPage,
            onTabChange: (int index) {
              setState(() {
                actualPage = index;
                widget.currentIndex(index);
              });
            },
          ),
        ),
      ),
    );
  }
}
