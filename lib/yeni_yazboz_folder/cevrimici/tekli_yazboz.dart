import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TekliYazboz extends StatefulWidget {
  const TekliYazboz({super.key});

  @override
  State<TekliYazboz> createState() => _TekliYazbozState();
}

class _TekliYazbozState extends State<TekliYazboz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              '1. Kişi',
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
                  hintText: '1. kişiyi girin',
                  hintStyle: GoogleFonts.spaceGrotesk(
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
              '2. Kişi',
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
                  hintText: '2. kişiyi girin',
                  hintStyle: GoogleFonts.spaceGrotesk(
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
              '3. Kişi',
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
                  hintText: '3. kişiyi girin',
                  hintStyle: GoogleFonts.spaceGrotesk(
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
              '4. Kişi',
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
                  hintText: '4. kişiyi girin',
                  hintStyle: GoogleFonts.spaceGrotesk(
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
