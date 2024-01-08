import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yuzbir_yazboz/service/auth.dart';
import 'package:yuzbir_yazboz/service/ilanlar.dart';

class YeniIlan extends StatefulWidget {
  const YeniIlan({super.key});

  @override
  State<YeniIlan> createState() => _YeniIlanState();
}

class _YeniIlanState extends State<YeniIlan> {
  List<String> sehirler = [
    'Adana',
    'Adıyaman',
    'Afyonkarahisar',
    'Ağrı',
    'Amasya',
    'Ankara',
    'Antalya',
    'Artvin',
    'Aydın',
    'Balıkesir',
    'Bilecik',
    'Bingöl',
    'Bitlis',
    'Bolu',
    'Burdur',
    'Bursa',
    'Çanakkale',
    'Çankırı',
    'Çorum',
    'Denizli',
    'Diyarbakır',
    'Edirne',
    'Elazığ',
    'Erzincan',
    'Erzurum',
    'Eskişehir',
    'Gaziantep',
    'Giresun',
    'Gümüşhane',
    'Hakkâri',
    'Hatay',
    'Isparta',
    'Mersin',
    'İstanbul',
    'İzmir',
    'Kars',
    'Kastamonu',
    'Kayseri',
    'Kırklareli',
    'Kırşehir',
    'Kocaeli',
    'Konya',
    'Kütahya',
    'Malatya',
    'Manisa',
    'Kahramanmaraş',
    'Mardin',
    'Muğla',
    'Muş',
    'Nevşehir',
    'Niğde',
    'Ordu',
    'Rize',
    'Sakarya',
    'Samsun',
    'Siirt',
    'Sinop',
    'Sivas',
    'Tekirdağ',
    'Tokat',
    'Trabzon',
    'Tunceli',
    'Şanlıurfa',
    'Uşak',
    'Van',
    'Yozgat',
    'Zonguldak',
    'Aksaray',
    'Bayburt',
    'Karaman',
    'Kırıkkale',
    'Batman',
    'Şırnak',
    'Bartın',
    'Ardahan',
    'Iğdır',
    'Yalova',
    'Karabük',
    'Kilis',
    'Osmaniye',
    'Düzce',
  ];
  List<String> kacKisi = [
    '1',
    '2',
    '3',
  ];
  String? selectedSehir;
  String? selectedKisi;
  TextEditingController aciklamaController = TextEditingController();
  String tarih = DateFormat('dd/MM/yyyy - hh:mm aaa').format(DateTime.now());
  FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = AuthService().currentUser;
  @override
  void initState() {
    super.initState();
    selectedSehir = sehirler[0];
    selectedKisi = kacKisi[0];
    updateAciklama();
  }

  void updateAciklama() {
    setState(() {
      aciklamaController.text =
          '$selectedSehir bölgesinde okey oyunumuz için $selectedKisi kişi aramaktayız.';
    });
  }

  Future<void> addData({
    required String collection,
    required String aciklama,
    required String sehir,
    required String kisiSayisi,
    required String tarih,
    required String userEmail,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userEmail = user.email ?? 'User email';
      final docPlace = FirebaseFirestore.instance.collection(collection).doc();
      final ilanlar = Ilanlar(
        id: docPlace.id,
        aciklama: aciklamaController.text,
        sehir: selectedSehir.toString(),
        kisiSayisi: selectedKisi.toString(),
        tarih: tarih,
        userEmail: userEmail,
      );
      final json = ilanlar.toJson();
      await docPlace.set(json);
    }
  }

  final snackBar = SnackBar(
    content: Text(
      'İlan başarıyla paylaşıldı',
      style: GoogleFonts.spaceGrotesk(),
    ),
    action: SnackBarAction(
      label: 'Tamam',
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    String userEmail = user?.email ?? 'User email';
    void onButtonPressed() {
      addData(
        collection: 'ilanlar',
        aciklama: aciklamaController.text,
        sehir: selectedSehir.toString(),
        kisiSayisi: selectedKisi.toString(),
        tarih: tarih,
        userEmail: userEmail,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Yeni İlan',
          style: GoogleFonts.spaceGrotesk(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Buradan yeni ilan oluşturabilirsiniz',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1F3A5F),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Şehir seçin',
                          style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          items: sehirler.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedSehir = newValue!;
                            updateAciklama();
                          },
                          value: selectedSehir,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1F3A5F),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Kaç kişi lazım',
                          style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          items: kacKisi.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            selectedKisi = newValue!;
                            updateAciklama();
                          },
                          value: selectedKisi,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1F3A5F),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Açıklama ekleyebilirsiniz',
                          style: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextField(
                        controller: aciklamaController,
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Açıklama',
                          labelStyle: GoogleFonts.spaceGrotesk(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 0.5),
                          ),
                          focusColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  onButtonPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F3A5F),
                  fixedSize: const Size(150, 50),
                ),
                child: Text(
                  'Yayınla',
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
    );
  }
}
