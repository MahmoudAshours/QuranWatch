import 'package:flutter/material.dart';
import 'package:testapp/Screens/Read/read_screen.dart';
import 'package:testapp/watch_renderer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WatchRenderer(child: ReadScreen()),
    );
  }
}
