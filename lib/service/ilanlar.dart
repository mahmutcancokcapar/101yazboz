class Ilanlar {
  String id;
  final String aciklama;
  final String sehir;
  final String kisiSayisi;
  final String tarih;
  final String userEmail;

  Ilanlar({
    this.id = '',
    required this.aciklama,
    required this.sehir,
    required this.kisiSayisi,
    required this.tarih,
    required this.userEmail,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'aciklama': aciklama,
        'sehir': sehir,
        'kisiSayisi': kisiSayisi,
        'tarih': tarih,
        'userEmail': userEmail,
      };

  static Ilanlar fromJson(Map<String, dynamic> json) => Ilanlar(
        id: json['id'],
        aciklama: json['aciklama'],
        sehir: json['sehir'],
        kisiSayisi: json['kisiSayisi'],
        tarih: json['tarih'],
        userEmail: json['userEmail'],
      );
}
