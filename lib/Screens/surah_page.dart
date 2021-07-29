import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/models/surah.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class SurrahPage extends StatefulWidget {
  final List<Surah> surah;
  final int surahStartingPage;
  final int surahid;

  const SurrahPage(
      {Key? key,
      required this.surah,
      required this.surahid,
      required this.surahStartingPage})
      : super(key: key);

  @override
  _SurrahPageState createState() => _SurrahPageState();
}

class _SurrahPageState extends State<SurrahPage> {
  late var _surahList;
  late StreamSubscription<RotaryEvent> rotarySubscription;
  @override
  void initState() {
    _surahList = widget.surah
        .where((element) => element.surahId == widget.surahid)
        .toList();
    rotarySubscription = rotaryEvents.listen((RotaryEvent event) {
      if (event == RotaryEvent.clockwise) {
        // Do something.
      } else if (event == RotaryEvent.counterClockwise) {
        // Do something.
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    rotarySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQueryHeight = MediaQuery.of(context).size.height;
    final _mediaQueryWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                spacing: 1,
                children: _surahList
                    .map(
                      (element) {
                        return Container(
                          width: _mediaQueryWidth,
                          height: _mediaQueryHeight,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                element.arabicText,
                                textDirection: TextDirection.rtl,
                                strutStyle: StrutStyle(height: 2.9),
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
