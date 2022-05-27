import 'package:animated_background/animated_background.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_clock_app/rain.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double oldHeight = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double height = oldHeight - padding.top - padding.bottom;

    // ParticleType? _particleType = ParticleType.Image;

    return Scaffold(
        //   body: AnimatedBackground(
        //   behaviour: RainParticleBehaviour(),
        //   vsync: this,
        //   child: const Text('Hello'),
        // ));

        body: Stack(children: [
      Container(
        decoration: bgGrad,
      ),
      AnimatedBackground(
        behaviour: racingLinesBehaviour,
        vsync: this,
        child: const Text('Hello'),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: 200,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text('12:00'),
                  Text('AM'),
                ],
              )),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
            width: width * 0.9,
            height: height * 0.1,
            decoration: alarmGrad,
            child: ,
          ),
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
          child: ElevatedButton(
            onPressed: () {},
            child: const Icon(
              Icons.add_box_rounded,
              size: 100,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: CurvedNavigationBar(
            buttonBackgroundColor: Colors.white.withOpacity(0.7),
            backgroundColor: Colors.grey.withOpacity(0.3),
            color: Colors.white.withOpacity(0.6),
            items: const [
              Icon(Icons.alarm, size: 30),
              Icon(Icons.watch_later_outlined, size: 30),
              Icon(Icons.timer, size: 30),
              Icon(Icons.bed, size: 30),
            ],
            onTap: (index) {},
            animationDuration: const Duration(milliseconds: 300),
          ),
        ),
      ),
    ]));
  }
}
