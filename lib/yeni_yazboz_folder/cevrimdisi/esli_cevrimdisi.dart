import 'package:flutter/material.dart';

class EsliCevrimdisi extends StatefulWidget {
  const EsliCevrimdisi({super.key});

  @override
  State<EsliCevrimdisi> createState() => _EsliCevrimdisiState();
}

class _EsliCevrimdisiState extends State<EsliCevrimdisi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Eşli Yazboz',
        ),
      ),
    );
  }
}
