import 'package:flutter/material.dart';

class ParametrePage extends StatelessWidget {
  const ParametrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parametre'),
      ),
      body: const Center(
        child: Text(
          'Parametre Page',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}