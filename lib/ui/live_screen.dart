import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({ Key? key }) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Coming Soon..."),
      ),
    );
  }
}