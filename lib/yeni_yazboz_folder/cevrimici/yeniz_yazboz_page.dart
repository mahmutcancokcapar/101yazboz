import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/cevrimici/esli_yazboz.dart';
import 'package:yuzbir_yazboz/yeni_yazboz_folder/cevrimici/tekli_yazboz.dart';

class YeniYazbozPage extends StatefulWidget {
  const YeniYazbozPage({super.key});

  @override
  State<YeniYazbozPage> createState() => _YeniYazbozPageState();
}

class _YeniYazbozPageState extends State<YeniYazbozPage>
    with SingleTickerProviderStateMixin {
  bool tekliMi = true;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      )..forward();
    });
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
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Yeni Yazboz Oluşturun',
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 30,
            child: Container(
              width: double.infinity,
              height: screenHeight * 2.8 / 4,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: tekliMi ? const TekliYazboz() : const EsliYazboz(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
