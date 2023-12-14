import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TekliOyunGecmisi extends StatefulWidget {
  const TekliOyunGecmisi({super.key});

  @override
  State<TekliOyunGecmisi> createState() => _TekliOyunGecmisiState();
}

class _TekliOyunGecmisiState extends State<TekliOyunGecmisi> {
  String selectedOption = 'Tüm Zamanlar';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Tekli Oyun Geçmişi',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                  onPressed: () {
                    _showPopupMenu(context);
                  },
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.2,
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      selectedOption,
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              child: Container(
                width: double.infinity,
                height: screenHeight * 2.1 / 4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: Image.asset(
                            'assets/gifs/bos.gif',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Henüz tekli yazboz geçmişiniz yok',
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    String? result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        140, // sol kenar
        600, // üst kenar
        overlay.size.width, // sağ kenar
        overlay.size.height, // alt kenar
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'Tüm Zamanlar',
          child: Text('Tüm Zamanlar'),
        ),
        const PopupMenuItem<String>(
          value: 'Bugün',
          child: Text('Bugün'),
        ),
      ],
      initialValue: selectedOption,
    );

    if (result != null && result != selectedOption) {
      setState(() {
        selectedOption = result;
      });
    }
  }
}
