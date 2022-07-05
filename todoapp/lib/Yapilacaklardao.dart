import 'package:todoapp/VeritabaniYardimcisi.dart';
import 'package:todoapp/Yapilicaklar.dart';

class Yapilacaklardao {
  Future<List<Yapilacaklar>> tumGorev() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM yapilacaklar");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Yapilacaklar(
          satir["yapilacak_id"], satir["gorev"], satir["tarih"]);
    });
  }

  Future<void> gorevEkle(String? gorev, String? tarih) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["gorev"] = gorev;
    bilgiler["tarih"] = tarih;

    await db.insert("yapilacaklar", bilgiler);
  }

  Future<void> gorevSil(int gorev_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db
        .delete("yapilacaklar", where: "yapilacak_id=?", whereArgs: [gorev_id]);
  }
}
