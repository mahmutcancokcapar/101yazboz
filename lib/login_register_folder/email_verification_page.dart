import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/main_folder/main_page.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> checkEmailVerification(BuildContext context) async {
    User? user = _auth.currentUser;
    await user?.reload();
    user = _auth.currentUser;

    if (user != null && user.emailVerified) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AnaSayfa(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Doğrulama Hatası',
              style: GoogleFonts.spaceGrotesk(),
            ),
            content: Text(
              'Lütfen E-Posta adresinize gönderdiğimiz linke tıklayarak E-Posta adresinizi doğrulayın',
              style: GoogleFonts.indieFlower(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Tamam',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'E-Mail Doğrulama\nSayfası',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.spaceGrotesk(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            right: 30,
            left: 30,
            child: Container(
              width: double.infinity,
              height: screenHeight * 1.8 / 4,
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'E-Posta adresinize bir doğrulama linki gönderilmiştir, lütfen uygulamayı kapatmadan arka plana alıp e-postanıza gönderilen doğrulama linkine tıklayın. Ardından tekrar uygulamaya dönerek aşağıda bulunan \'Doğrulamayı Kontrol Et\' butonuna basın.',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      '\'${_auth.currentUser!.email}\'',
                      style: GoogleFonts.spaceGrotesk(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkEmailVerification(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F3A5F),
                        fixedSize: const Size(250, 50),
                      ),
                      child: Text(
                        'Doğrulamayı Kontrol Et',
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
