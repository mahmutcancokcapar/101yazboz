import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/cevrimdisi/esli_cevrimdisi.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/cevrimdisi/tekli_cevrimdisi.dart';

class YeniYazbozCevrimdisi extends StatefulWidget {
  const YeniYazbozCevrimdisi({super.key});

  @override
  State<YeniYazbozCevrimdisi> createState() => _YeniYazbozCevrimdisiState();
}

class _YeniYazbozCevrimdisiState extends State<YeniYazbozCevrimdisi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Yeni Yazboz',
            style: GoogleFonts.spaceGrotesk(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Tekli Yazboz',
              ),
              Tab(
                text: 'Eşli Yazboz',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TekliCevrimdisi(),
            EsliCevrimdisi(),
          ],
        ),
      ),
    );
  }
}
