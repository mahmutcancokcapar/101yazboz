import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EsliYazboz extends StatefulWidget {
  const EsliYazboz({super.key});

  @override
  State<EsliYazboz> createState() => _EsliYazbozState();
}

class _EsliYazbozState extends State<EsliYazboz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'A Takımı',
              style: GoogleFonts.spaceGrotesk(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              child: TextField(
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'A Takımı 1. Kişi',
                  labelStyle: GoogleFonts.spaceGrotesk(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: TextField(
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'A Takımı 2. Kişi',
                  labelStyle: GoogleFonts.spaceGrotesk(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Divider(),
            ),
            Text(
              'B Takımı',
              style: GoogleFonts.spaceGrotesk(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              child: TextField(
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'B Takımı 1. Kişi',
                  labelStyle: GoogleFonts.spaceGrotesk(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: TextField(
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'B Takımı 2. Kişi',
                  labelStyle: GoogleFonts.spaceGrotesk(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F3A5F),
                fixedSize: const Size(150, 50),
              ),
              child: Text(
                'Başla',
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
