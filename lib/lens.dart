import 'package:flutter/material.dart';
import 'package:bubble_lens/bubble_lens.dart';

class LensAnimation extends StatelessWidget {
  const LensAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        color: Colors.black,
        child: BubbleLens(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            widgets: [
              for (var i = 0; i < 50; i++)
                Container(
                  width: 100,
                  height: 100,
                  color: [Colors.red, Colors.green, Colors.blue][i % 3],
                )
            ]),
      )),
    );
  }
}
