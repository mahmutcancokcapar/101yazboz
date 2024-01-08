import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuzbir_yazboz/kesfet_folder/ilan_card.dart';
import 'package:yuzbir_yazboz/kesfet_folder/yeni_ilan.dart';

class KesfetPage extends StatefulWidget {
  const KesfetPage({super.key});

  @override
  State<KesfetPage> createState() => _KesfetPageState();
}

class _KesfetPageState extends State<KesfetPage> {
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
  @override
  void initState() {
    super.initState();
    selectedSehir = sehirler[0];
    selectedKisi = kacKisi[0];
  }

  String? userUID;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
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
                              'Oyun Arkadaşı Bulun',
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
            top: 120,
            right: 30,
            left: 30,
            child: Container(
              width: double.infinity,
              height: screenHeight * 2.8 / 4,
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
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Filtreler ve Yeni İlan',
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const YeniIlan(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Text(
                                    selectedSehir.toString(),
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '$selectedKisi Kişi',
                            style: GoogleFonts.spaceGrotesk(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Divider(),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ilanlar')
                          .where(
                            'sehir',
                            isEqualTo: selectedSehir.toString(),
                          )
                          .where(
                            'kisiSayisi',
                            isEqualTo: selectedKisi.toString(),
                          )
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          final ilanList = snapshot.data!.docs;
                          return GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 1.6,
                            children: ilanList
                                .map<Widget>(
                                  (ilan) => IlanCard(
                                    doc: ilan,
                                    userUID: userUID ?? '',
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return Column(
                            children: [
                              Center(
                                child: Text(
                                  'Kriterlerinize uygun seçenek bulunamadı',
                                  style: GoogleFonts.spaceGrotesk(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Filtreleme Seçenekleri',
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Şehir',
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
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      items: sehirler.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.spaceGrotesk(),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedSehir = newValue!;
                        });
                      },
                      value: selectedSehir,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Aranan Kişi Sayısı',
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
                  child: SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      items: kacKisi.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.spaceGrotesk(),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedKisi = newValue!;
                        });
                      },
                      value: selectedKisi,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Filtreyi Uygula',
                    style: GoogleFonts.spaceGrotesk(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
