import 'package:flutter/material.dart';

class TekliCevrimdisi extends StatefulWidget {
  const TekliCevrimdisi({super.key});

  @override
  State<TekliCevrimdisi> createState() => _TekliCevrimdisiState();
}

class _TekliCevrimdisiState extends State<TekliCevrimdisi> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tekli Yazboz',
        ),
      ),
    );
  }
}
