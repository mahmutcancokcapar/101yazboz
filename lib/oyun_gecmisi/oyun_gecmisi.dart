import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/oyun_gecmisi/esli_oyun%20gecmisi.dart';
import 'package:yuzbir_yazboz/oyun_gecmisi/tekli_oyun_gecmisi.dart';

class OyunGecmisiPage extends StatefulWidget {
  const OyunGecmisiPage({Key? key}) : super(key: key);

  @override
  State<OyunGecmisiPage> createState() => _OyunGecmisiPageState();
}

class _OyunGecmisiPageState extends State<OyunGecmisiPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool tekliMi = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 1.2 / 4,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F3A5F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Oyun Geçmişi',
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: screenHeight * 0.35 / 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4D648D),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tekliMi = true;
                                });
                                _controller.forward();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 115,
                                height: screenHeight * 0.27 / 4,
                                decoration: BoxDecoration(
                                  color: tekliMi
                                      ? const Color(0xFF1F3A5F)
                                      : const Color(0xFF4D648D),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Tekli',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  tekliMi = false;
                                });
                                _controller.reverse();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 115,
                                height: screenHeight * 0.27 / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: tekliMi
                                      ? const Color(0xFF4D648D)
                                      : const Color(0xFF1F3A5F),
                                ),
                                child: Center(
                                  child: Text(
                                    'Eşli',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color(0xFF1F3A5F),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(100)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: tekliMi
                          ? const TekliOyunGecmisi()
                          : const EsliOyunGecmisi(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '101 Yazboz\nArkadaş Bulma',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Divider(),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Kullanıcı Adı',
                          style: GoogleFonts.spaceGrotesk(),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Divider(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F3A5F),
                    fixedSize: const Size(140, 30),
                  ),
                  child: Text(
                    'Çıkış Yap',
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
