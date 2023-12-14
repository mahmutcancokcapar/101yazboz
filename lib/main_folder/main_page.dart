import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yuzbir_yazboz/kesfet_folder/kesfet.dart';
import 'package:yuzbir_yazboz/oyun_gecmisi/oyun_gecmisi.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/yeniz_yazboz_page.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = [
    const OyunGecmisiPage(),
    const YeniYazbozPage(),
    const KesfetPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.file_copy,
        size: 30,
      ),
      const Icon(
        Icons.add,
        size: 30,
      ),
      const Icon(
        Icons.donut_small_outlined,
        size: 30,
      ),
    ];
    return Container(
      color: const Color(0xFF1F3A5F), // pek
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            backgroundColor: const Color(0xFF1F3A5F), // pek
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                color: const Color(0xFF1F3A5F),
                buttonBackgroundColor: const Color(0xFF1F3A5F),
                items: items,
                height: 60,
                index: 0,
                backgroundColor: Colors.white,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
            body: screens[index],
          ),
        ),
      ),
    );
  }
}
