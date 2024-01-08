import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IlanCard extends StatefulWidget {
  final QueryDocumentSnapshot doc;
  final String userUID;
  const IlanCard({
    super.key,
    required this.doc,
    required this.userUID,
  });

  @override
  State<IlanCard> createState() => _IlanCardState();
}

class _IlanCardState extends State<IlanCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F3A5F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.doc['sehir'],
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.doc['kisiSayisi'] + ' Kişi',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              widget.doc['aciklama'],
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(),
            Text(
              widget.doc['userEmail'],
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
