import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:testapp/models/surah.dart';

import '../surah_page.dart';

class ReadScreen extends StatefulWidget {
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  List<Surah> surahList = [];
  static List<int> _surahIndexes = List.unmodifiable([
    1,
    2,
    50,
    77,
    106,
    128,
    151,
    177,
    187,
    208,
    221,
    235,
    249,
    255,
    262,
    267,
    282,
    293,
    305,
    312,
    322,
    332,
    342,
    350,
    359,
    367,
    377,
    385,
    396,
    404,
    411,
    415,
    418,
    428,
    434,
    440,
    446,
    453,
    458,
    467,
    477,
    483,
    489,
    496,
    499,
    502,
    507,
    511,
    515,
    518,
    520,
    523,
    526,
    528,
    531,
    534,
    537,
    542,
    545,
    549,
    551,
    553,
    554,
    556,
    558,
    560,
    562,
    564,
    566,
    568,
    570,
    572,
    574,
    575,
    577,
    578,
    580,
    582,
    583,
    585,
    586,
    587,
    587,
    589,
    590,
    591,
    591,
    592,
    593,
    594,
    595,
    595,
    596,
    596,
    597,
    597,
    598,
    598,
    599,
    599,
    600,
    600,
    601,
    601,
    601,
    602,
    602,
    602,
    603,
    603,
    603,
    604,
    604,
    604,
  ]);
  List<String> list2 = [];
  Future<void> loadSurah() async {
    final List<Surah> loaded = [];
    final List<String> list = [];
    String surah = await rootBundle.loadString('assets/surah_1.json');
    var decodedSurah = jsonDecode(surah);
    SurahModel x = SurahModel.fromJson(decodedSurah);
    x.surah.forEach(
      (e) {
        loaded.add(
          Surah(
            arabicLetterCount: e.arabicLetterCount,
            arabicText: e.arabicText,
            arabicWordCount: e.arabicWordCount,
            ayaTafseerMoussar: e.ayaTafseerMoussar,
            ayahNo: e.ayahNo,
            classification: e.classification,
            englishTranslation: e.englishTranslation,
            id: e.id,
            juz: e.juz,
            juzNameArabic: e.juzNameArabic,
            juzNameEnglish: e.juzNameEnglish,
            lineEnd: e.lineEnd,
            lineStart: e.lineStart,
            orignalArabicText: e.orignalArabicText,
            page: e.page,
            surahId: e.surahId,
            surahMeaning: e.surahMeaning,
            surahNameArabic: e.surahNameArabic,
            surahNameEnglish: e.surahNameEnglish,
          ),
        );
      },
    );

    surahList = loaded.toList();

    for (int i = 0; i < surahList.length; i++) {
      list.add(surahList[i].surahNameArabic);
    }

    list2 = list.toSet().toList();
  }

  bool load = true;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (load) {
      await loadSurah();
      setState(() {
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQueryHeight = MediaQuery.of(context).size.height;
    final _mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black45,
      body: load
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                itemCount: list2.length,
                addAutomaticKeepAlives: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(top: 10)
                        : EdgeInsets.only(top: _mediaQueryHeight / 3),
                    child: GestureDetector(
                      child: Center(
                        child: Container(
                          width: _mediaQueryWidth,
                          height: _mediaQueryHeight,
                          child: Center(
                            child: Text(
                              '${list2[index]}',
                              textDirection: TextDirection.rtl,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                          padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(212, 175, 55, 1)),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SurrahPage(
                                  surah: surahList,
                                  surahid: surahList[index].id,
                                  surahStartingPage: _surahIndexes[index]);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
