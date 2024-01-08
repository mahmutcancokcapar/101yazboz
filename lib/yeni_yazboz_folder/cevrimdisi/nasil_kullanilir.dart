import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/cevrimdisi/yeni_yazboz_cevrimdisi.dart';

class NasilKullanilir extends StatefulWidget {
  const NasilKullanilir({super.key});

  @override
  State<NasilKullanilir> createState() => _NasilKullanilirState();
}

class _NasilKullanilirState extends State<NasilKullanilir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Nasıl Kullanılır',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YeniYazbozCevrimdisi(),
                        ),
                      );
                    },
                    child: Text(
                      'Devam Et',
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
