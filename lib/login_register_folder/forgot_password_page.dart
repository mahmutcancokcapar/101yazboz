import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  bool isButtonEnabled = false;
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void checkField() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty;
    });
  }

  Future resetPassword() async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Şifre yenileme linki E-Posta adresinize gönderilmiştir.',
            style: GoogleFonts.spaceGrotesk(),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
                style: GoogleFonts.spaceGrotesk(),
              ),
              actions: [
                ElevatedButton(
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
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFD4EAF7),
                      Color(0xFFB6CCD8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Şifremi Unuttum',
                        style: GoogleFonts.spaceGrotesk(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            right: 30,
            left: 30,
            child: Container(
              width: double.infinity,
              height: screenHeight * 2 / 4,
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
                borderRadius: BorderRadius.circular(40),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        'Şifrenizi yenilemek için E-Mail adresinizi girin ve ardından \'Şifreyi Yenile\' butonuna basın',
                        style: GoogleFonts.spaceGrotesk(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextField(
                        controller: emailController,
                        onChanged: (value) => checkField(),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          labelText: 'E-Mail adresiniz',
                          labelStyle:
                              GoogleFonts.spaceGrotesk(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: isButtonEnabled ? resetPassword : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F3A5F),
                        fixedSize: const Size(200, 60),
                      ),
                      child: Text(
                        'Şifreyi Yenile',
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
        ],
      ),
    );
  }
}
