import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyStopWatch extends StatelessWidget {
  // const MyStopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('StopWatch Page',
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black));
  }
}
