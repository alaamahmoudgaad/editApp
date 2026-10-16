import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(235, 221, 255, 1),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color.fromARGB(255, 134, 141, 145),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}