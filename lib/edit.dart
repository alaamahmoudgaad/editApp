import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(235, 221, 255, 1),
        title: Text(
          'Edit',
          style: TextStyle(
            color: Color.fromARGB(255, 134, 141, 145),
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}