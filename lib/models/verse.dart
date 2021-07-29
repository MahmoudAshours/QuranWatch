import 'package:testapp/models/surah.dart';

class Verse {
  int number;
  String text;

  Surah surah;
  List<Surah> surahModel;
  Verse(this.number, this.text, this.surah,this.surahModel);
}
