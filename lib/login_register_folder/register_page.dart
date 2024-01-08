import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/login_register_folder/email_verification_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool isObsecure = true;
final FirebaseAuth _auth = FirebaseAuth.instance;

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rpasswordController = TextEditingController();

  String errorMessage = '';
  Future<void> registerUser(BuildContext context) async {
    try {
      if (passwordController.text == rpasswordController.text) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await userCredential.user!.sendEmailVerification();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EmailVerificationPage(),
          ),
        );
      } else {
        errorMessage = 'Şifre tekrarını yanlış girdiniz, lütfen kontrol edin';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Hata',
              style: GoogleFonts.spaceGrotesk(),
            ),
            content: Text(
              'Kayıt Başarısız',
              style: GoogleFonts.spaceGrotesk(),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Kayıt oluşturulurken bir şeyler ters gitti, lütfen tekrar deneyiniz',
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
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Buradan yeni kayıt oluşturabilirsiniz',
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF3B3C3D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'E-Mail Adresiniz',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'example@gmail.com',
                  hintStyle: GoogleFonts.spaceGrotesk(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Şifreniz',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: passwordController,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    icon: isObsecure
                        ? const Icon(
                            Icons.remove_red_eye,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.green,
                          ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Şifrenizi doğrulayın',
                  style: GoogleFonts.spaceGrotesk(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: TextField(
                controller: rpasswordController,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                registerUser(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F3A5F),
                fixedSize: const Size(150, 50),
              ),
              child: Text(
                'Kaydol',
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
    );
  }
}
