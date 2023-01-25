
import 'package:crypto_app/controller/load_page_info.dart';
import 'package:crypto_app/controller/routes.dart';
import 'package:crypto_app/themes/bloc/theme_bloc.dart';
import 'package:crypto_app/ui/Widgets/home_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: MaterialApp(home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // traverse screens
  int index = 0;
  PersonalBottomNavigationBar? myBNB;

  LoadPage mainInfo = LoadPage();

  late Future<dynamic> information;

  @override
  void initState() {
    super.initState();

    //WITH OR WITHOUT API
    mainInfo.setApiRequestMode = true;

    myBNB = PersonalBottomNavigationBar(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0D0D0D),
        bottomNavigationBar: myBNB,
        body: NavigationRoutes(
          index: index,
        ));
  }
}
