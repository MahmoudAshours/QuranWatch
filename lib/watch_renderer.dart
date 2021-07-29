import 'package:flutter/material.dart';

class WatchRenderer extends StatelessWidget {
  final child;

  const WatchRenderer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
