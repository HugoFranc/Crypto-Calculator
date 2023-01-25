
import 'package:crypto_app/themes/themes.dart';
import 'package:crypto_app/ui/Widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int themeCounter = 0;
  @override
  Widget build(BuildContext context) {
    final singleTheme = AppThemes.values[themeCounter];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF242934).withOpacity(.7),
        title: const AppBarTittle(
          name: "Settings",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text("Coming Soon...")
            /*

              const InkWell(
                child: Text('Press me to change theme'),
                onTap: (){
                       BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeChangedEvent(theme: singleTheme));
                    setState(() {
                      if (themeCounter == 1) {
                        themeCounter = 0;
                      } else {
                        themeCounter = 1;
                      }
                    });
                },),
                */
          ],
        ),
      ),
    );
  }
}
